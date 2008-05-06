require 'validate'

module Mart
  module Accounts
    class AbstractAccount
  
      include DataMapper::Resource
      include DataMapper::Validate
      require 'ezcrypto'

      property :type,         Class   # single-table inheritance
      property :order_id,     Fixnum  # foreign-key
      property :customer_id,  Fixnum  # foreign-key
    
      one_to_one  :order
      many_to_one :customer #, :accessor => :protected

    end
  end
end