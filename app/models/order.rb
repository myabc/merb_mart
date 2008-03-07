class Order
  
  include DataMapper::Persistable
  
  has_many :order_line_items, :dependent => :destroy
  
  # billing_address defined as a method!
  has_one :billing_address,  :class => 'OrderAddress', :foreign_key => 'billing_address_id'
  has_one :shipping_address, :class => 'OrderAddress', :foreign_key => 'shipping_address_id'
  
  belongs_to :order_account
  belongs_to :order_user
  belongs_to :order_shipping_type
  belongs_to :order_status_code
  belongs_to :promotion
  
  attr_accessor :promotion_code
  
  property :order_number,  :integer,  :default => 0,   :nullable => false, :index => :unique
  property :created_on,    :datetime
  property :shipped_on,    :datetime
  property :notes,         :text
  property :referer,       :string
  property :product_cost,  :float,    :default => 0.0
  property :shipping_cost, :float,    :default => 0.0
  property :tax,           :float,    :default => 0.0, :nullable => false

  #property t.string   :auth_transaction_id"
  #property t.integer  :shipping_address_id",    :default => 0,   :null => false
  #property t.integer  :billing_address_id",     :default => 0,   :null => false
  
  #validates_presence_of   :order_number
  #validates_uniqueness_of :order_number
  
  # CALLBACKS =================================================================
  
  before_save :set_product_cost
  before_save :set_promo_code
  
  # Sets product cost based on line items total before a save.
  def set_product_cost
    self.product_cost = self.line_items_total
  end
  
  # Modifies the order based on any promotion codes passed in.
  #
  # This can add discounts to the order or add items.
  #
  # Returns silently and just doesn't add the promo if something
  # is wrong.
  #
  def set_promo_code
    # Find promotion based on code entered
    promo = Promotion.first(:code => self.promotion_code)

    # No promo code? Not active? No deal...
    return if !promo || !promo.is_active?
    
    # Make sure it's valid to add
    if promo.minimum_cart_value
      return if promo.minimum_cart_value > self.total
    end
    logger.info "PROMO MIN CART VALUE PASSED"
    
    # Don't allow more than one promotion?
    # This destroys any line items created previously.
    self.promotion_line_item.destroy if self.promotion_line_item
    
    # Assign proper promotion ID
    self.promotion_id = promo.id
    
    # Add any line items necessary from promotion.
    oli = OrderLineItem.new
    logger.info "CREATED OLI"
    # Set name & item...
    oli.name = promo.description
    oli.item_id = promo.item_id
    
    # Figure out how to apply the promotion
    case promo.discount_type
      # Dollars
      when 0 then
        oli.quantity = 1
        oli.unit_price = -promo.discount_amount
      #
      # Percent
      when 1 then
        oli.quantity = 1
        oli.unit_price = -(self.total * (promo.discount_amount/100))
      #
      # Buy N get 1 free
      when 2 then
        item = self.order_line_items.detect { |i| i.item_id == promo.item_id }
        if item && item.quantity >= promo.discount_amount.to_i
          oli.quantity = item.quantity / promo.discount_amount.to_i
          logger.info "ITEM QUANTITY #{oli.quantity}"
        else
          return
        end
    end
    
    self.order_line_items << oli
  end
  
  # INSTANCE METHODS ==========================================================

  # Shortcut to find order_line_item for a promotion that has been applied.
  def promotion_line_item
    if self.promotion
      return self.order_line_items.find_by_name(self.promotion.description)
    else
      return nil
    end
  end
  
  # Order status name
  def status
    code = OrderStatusCode.first(:id => self.order_status_code_id)
    code.name
  end
  
  # Shortcut to items
  def items
    self.order_line_items
  end
  
  # Total for the order, including shipping and tax.
  #
  def total
    logger.info "CALCULATING SHIPPING TOTAL"
    logger.info "LINE ITEMS TOTAL: #{self.line_items_total}"
    logger.info "SHIPPING COST: #{self.shipping_cost}"
    logger.info "TAX COST: #{self.tax_cost}"
    self.line_items_total + self.shipping_cost + self.tax_cost
  end
  
  # The tax of items if applied.
  #
  def tax_cost
    (self.line_items_total) * (self.tax/100)
  end
  
  def name
    return "#{billing_address.first_name} #{billing_address.last_name}"
  end
  
  def account
    self.order_account
  end
  
  # Sets line items from the product output table on the edit page.
  #
  # Deletes any line items with a quantity of 0.
  # Adds line items with a quantity > 0.
  #
  # This is called from update in our controllers.
  # What's passed looks something like this...
  #   @products = {'1' => {'quantity' => 2}, '2' => {'quantity' => 0}, etc}
  def line_items=(products)
    # Clear out all line items
    self.order_line_items.clear
    # Go through all products
    products.each do |id, product|
      quantity = product['quantity']
      if quantity.blank? then
        quantity = 0
      else
        quantity = Integer(quantity)
      end

      if (quantity > 0) then
        new_item = self.order_line_items.build
        logger.info("\n\nBUILDING NEW LINE ITEM\n")
        logger.info(new_item.inspect+"\n")
        new_item.quantity = quantity
        new_item.item_id = id
        new_item.unit_price = Item[:id].price
        new_item.save
      end
    end
  end

  # Do we have a valid transaction id
  def contains_valid_transaction_id?()
    return (!self.auth_transaction_id.blank? && self.auth_transaction_id != 0)
  end

  # Determines if an order has a line item based on product id
  def has_line_item?(id)
    self.order_line_items.each do |item|
      return true if item.id == id
    end
    return false
  end

  # Gets quantity of a product if exists in current line items.
  def get_line_item_quantity(id)
    self.order_line_items.each do |item|
      return item.quantity if item.id == id
    end
    return 0
  end

  # Gets a subtotal for line items based on product id
  def get_line_item_total(id)
    self.order_line_items.each do |item|
      return item.total if item.id == id
    end
    return 0
  end

  # Grabs the total amount of all line items associated with this order
  def line_items_total
    total = 0
    for item in self.order_line_items
      total += item.total
    end
    return total
  end

  # Adds a new order note from the edit page.
  #
  # We display notes as read-only, so we only have to use a text field
  # instead of multiple records.
  def new_notes=(note)
    if !note.blank? then
      time = Time.now.strftime("%m-%d-%y %I:%M %p")
      new_note = "<p>#{note}<br/>"
      new_note << "<span class=\"info\">"
      new_note << "[#{time}]"
      new_note << "</span></p>"
      if self.notes.blank? then
        self.notes = new_note
      else
        self.notes << new_note
      end
    end
  end

  # Calculates the weight of an order
  def weight
    weight = 0
    self.order_line_items.each do |item|
      weight += item.quantity * item.product.weight rescue 0
    end
    return weight
  end

  # Gets a flat shipping price for an order.
  # This is if we're not using live rate calculation usually
  #
  # A lot of people will want this overridden in their app
  def get_flat_shipping_price
    return Preference.find_by_name('store_handling_fee').value.to_f
  end

  # Gets all LIVE shipping prices for an order.
  #
  # Returns an array of OrderShippingTypes
  def get_shipping_prices
    prices = []
    # If they're in the USA
    address = self.shipping_address
    
    # TODO - set this country_id as a preference in the admin UI
    #
    if address.country_id == 1 then
      shipping_types = OrderShippingType.get_domestic
    else 
      shipping_types = OrderShippingType.get_foreign
    end

    for type in shipping_types
      type.calculate_price(self.weight)
      prices << type
    end

    return prices

  end

  # Runs an order transaction.
  # Farms out the work to an Authorize.net or PayPal method
  # (or one of your devising).
  #
  # Should return TRUE if the process is successful.
  # Should return AN ERROR MESSAGE if not...
  #
  def run_transaction
    cc_processor = Order.get_cc_processor 
    if cc_processor == Preference::CC_PROCESSORS[0]
      run_transaction_authorize
    elsif cc_processor == Preference::CC_PROCESSORS[1]
      run_transaction_paypal_ipn
    else
      throw "The currently set preference for cc_processor is not recognized. You might want to add it to the code..."
    end
  end
 
  # Check to see which cc processor is used
  def self.get_cc_processor
    Preference.find_by_name('cc_processor').value
  end

  # Get the login info for the cc processor (if any)
  def self.get_cc_login
    Preference.find_by_name('cc_login').value
  end

  # Runs an order through Authorize.net
  #
  # Returns true 
  #
  def run_transaction_authorize
    ba = self.billing_address
  
    # For debugging with a test account...
    # ActiveMerchant::Billing::Base.mode = :test
    
    credit_card = ActiveMerchant::Billing::CreditCard.new(
      :number     => self.account.cc_number,
      :month      => self.account.expiration_month,
      :year       => self.account.expiration_year,
      :first_name => ba.first_name,
      :last_name  => ba.last_name
    )
    gateway = ActiveMerchant::Billing::AuthorizeNetGateway.new(
      :login      => Preference.find_by_name('cc_login').value,
      :password   => Preference.find_by_name('cc_pass').value,
      :ssl_strict => true,
      :test       => Preference.find_by_name('store_test_transactions').is_true?
    )
    address = {
      :address1 => ba.address,
      :city     => ba.city,
      :state    => ba.state,
      :zip      => ba.zip,
      :country  => ba.country.name
    }
    
    # AM requires it's purchaes in CENTS, so adjust accordingly.
    response = gateway.purchase(self.total.to_f*100, credit_card, {:address => address})
    # Save transaction id for later
    self.auth_transaction_id = response.params[:transaction_id]
        
    # Handle the response
    if response.success?
      logger.info("\n\nORDER TRANSACTION ID - #{self.auth_transaction_id}\n\n")
      # Set completed
      self.cleanup_successful
      # Send success message
      begin
        self.deliver_receipt
      rescue => e
        logger.error("FAILED TO SEND THE CONFIRM EMAIL")
      end
      return true
    else
      # Log errors
      logger.error("\n\n[ERROR] FAILED ORDER \n")
      logger.error(response.inspect)
      logger.error(response.message)
      logger.error("\n\n")
      # Order failed - store transaction id
      self.cleanup_failed(response.message)
      # Send failed message
      begin
        self.deliver_failed
      rescue => e
        logger.error("FAILED TO SEND THE CONFIRM EMAIL")
      end

      return response.message
    end
    
    return false
  end
  
  # Do the cleanup for orders run through Paypal
  #
  def run_transaction_paypal_ipn

    status_code = self.order_status_code_id

    # Under normal conditions, the paypal ipn should be confirmed already
    # but we can't count on that.  Assign a status of 4 (awaiting payment)
    # if the status is still 1 (cart)
    if status_code == 1
      self.order_status_code_id = 4 
      self.new_notes = "The order was processed at PayPal but not yet confirmed."
    end

    self.save

    self.order_status_code_id
 
  end

  # Cleans up a successful order
  def cleanup_successful
    # Decrement inventory for items...
    # Also driven by the inventory control preference from the
    # admin UI
    if Preference.find_by_name('store_use_inventory_control').is_true?
      for oli in self.order_line_items do
        oli.item.update_attribute('quantity', oli.item.quantity-oli.quantity)if oli.quantity rescue false && oli.item.quantity rescue false
      end
    end
    
    self.order_status_code_id = 5
    self.new_notes="Order completed."
    if Preference.find_by_name('cc_clear_after_order').is_true?
      self.account.clear_personal_information
    end
    self.save
  end

  # Cleans up a failed order
  def cleanup_failed(msg)
    self.order_status_code_id = 3
    self.new_notes="Order failed!<br/>#{msg}"
    self.save
  end

  # We define deliver_receipt here because ActionMailer can't seem to render
  # components inside a template.
  #
  # I'm getting around this by passing the text into the mailer.
  def deliver_receipt
    @content_node = ContentNode.find(:first, :conditions => ["name = ?", 'OrderReceipt'])
    OrdersMailer.deliver_receipt(self, @content_node.content)
  end

  # If we're going to define deliver_receipt here, why not wrap deliver_failed as well?
  def deliver_failed
    OrdersMailer.deliver_failed(self)
  end

  # Is a discount present?
  def is_discounted?
    self.order_line_items.collect.each {|item| return true if item.unit_price < 0 }
    false
  end
  
end