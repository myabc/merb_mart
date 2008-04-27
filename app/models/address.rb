require 'validate'

class Address
  
  include DataMapper::Resource
  include DataMapper::Validate
  
  property :first_name, String, :length => 50, :nullable => false
  property :last_name,  String, :length => 50, :nullable => false
  property :company,    String, :length => 100
  property :telephone,  String, :length => 20
  property :address1,   String, :length => 200, :nullable => false
  property :address2,   String, :length => 200
  property :city,       String, :length => 50
  property :postal_code,String, :length => 10 
  
  many_to_one :state
  many_to_one :country
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :address
  validates_presence_of :zip
  
  validates_length_of :first_name, :maximum => 50
  validates_length_of :last_name,  :maximum => 50
  validates_length_of :address,    :maximum => 255
  
end