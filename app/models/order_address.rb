require 'validate'

class OrderAddress
  
  include DataMapper::Resource
  include DataMapper::Validate
  
  one_to_one :order
  many_to_one :order_user
  many_to_one :country
    
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
  
end