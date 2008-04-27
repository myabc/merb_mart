require 'validate'

class Account
  
  include DataMapper::Resource
  include DataMapper::Validate
  require 'ezcrypto'
  
  one_to_one :order_account_type
  one_to_one :order
  many_to_one :order_user, :accessor => :protected
  
  property :cc_number,        String
  property :account_number,   String
  property :expiration_month, Fixnum, :length => 2
  property :expiration_year,  Fixnum, :length => 4
  property :credit_ccv,       Fixnum, :length => 5
  property :routing_number,   String, :length => 20
  property :bank_name,        String, :length => 50

end