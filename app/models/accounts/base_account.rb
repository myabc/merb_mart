require 'validate'

module Accounts
  class BaseAccount
  
    include DataMapper::Resource
    include DataMapper::Validate
    require 'ezcrypto'

    property :type, Class # enable single-table inheritance    
    
    one_to_one :order
    many_to_one :customer, :accessor => :protected

  end
end