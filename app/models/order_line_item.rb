class OrderLineItem
  
  include DataMapper::Resource
  
  many_to_one :product
  many_to_one :store_item
  
  property :id,         Fixnum,  :serial => true
  property :quantity,   Fixnum,  :default => 0,   :nullable => false
  property :unit_price, Float,   :default => 0.0, :nullable => false
  property :name,       String,  :default => ""
  
  #alias_attribute :price, :unit_price
  
  # Creates and returns a line item when a product is passed in
  def self.for_product(item)
    ol_item = self.new
    ol_item.quantity = 1
    ol_item.item = item
    ol_item.name = item.name
    ol_item.unit_price = item.price
    return ol_item
  end

  def total
    self.quantity * self.unit_price
  end
  
  # We still have view code referencing product_id
  # Since we changed to variations / products we need
  # to use item_id.
  #
  def product_id
    self.item_id
  end
  
  def product
    self.item
  end
  
  def code
    self.item.code
  end
  
  def name
    if !self.item.nil?
      return self.item.name
    else
      return self.attributes['name']
    end
  end
  
  def price
    self.unit_price
  end
  
end