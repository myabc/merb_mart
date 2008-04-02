require 'validate'

class OrderAddress
  
  include DataMapper::Resource
  include DataMapper::Validate
  
  one_to_one :order
  many_to_one :order_user
  many_to_one :country
  
  #t.integer "order_user_id",               :default => 0,  :null => false
  
  property :first_name, String, :length => 50, :default => "", :nullable => false
  property :last_name,  String, :length => 50, :default => "", :nullable => false
  property :telephone,  String, :length => 20
  property :address,    String,                :default => "", :nullable => false
  property :city,       String, :length => 50
  property :state,      String, :length => 30
  property :zip,        String, :length => 10 
  
  # Validation
  validates_presence_of :order_user_id, :country_id
  validates_presence_of :zip, :message => "#{ERROR_EMPTY} If you live in a country that doesn't have postal codes please enter '00000'."
  validates_presence_of :telephone, :message => ERROR_EMPTY
  validates_presence_of :first_name, :message => ERROR_EMPTY
  validates_presence_of :last_name, :message => ERROR_EMPTY
  validates_presence_of :address, :message => ERROR_EMPTY
  
  validates_length_of :first_name, :maximum => 50
  validates_length_of :last_name, :maximum => 50
  validates_length_of :address, :maximum => 255
  
  # TODO: validates_with_method here??
  #validates_exclusion_of :address, :in => ['PO BOX', 'P.O. BOX', 'AFO', 'A.F.O.', 'APO', 'A.P.O.'],
  #                       :message => 'Sorry, we don\'nt ship to P.O. boxes'

  # Makes sure validation address doesn't allow PO Box or variants
  def validate
    invalid_strings = ['PO BOX', 'P.O. BOX', 'P.O BOX', 'PO. BOX',
                       'POBOX', 'P.OBOX', 'P.O.BOX', 'PO.BOX', 'P.BOX',
                       'PBOX', 'AFO', 'A.F.O.', 'APO', 'A.P.O.']
    cap_address = self.address.upcase()
    invalid_strings.each do |string|
      if cap_address.include?(string) then
        errors.add(:address, "Sorry, we don't ship to P.O. boxes")
        return
      end
    end
  end
  
	# Finds the shipping address for a given OrderUser
  def self.find_shipping_address_for_user(user)
    first(:conditions => ["order_user_id = ? AND is_shipping = 1", user.id])
  end
  
  def name
    "#{self.first_name} #{self.last_name}"
  end
  
end