require 'dm-validations'

module Mart
  class Customer
  
    include DataMapper::Resource
    include DataMapper::Validate
  
    property :id,            Fixnum,  :serial => true
    property :username,      String,  :length => 50
    property :email_address, String,  :length => 50, :nullable => false, :index => :unique
    property :password,      String,  :length => 20
    property :created_on,    DateTime
    property :first_name,    String,  :length => 50, :nullable => false
    property :last_name,     String,  :length => 50, :nullable => false

    has n, :orders
    has n, :addresses
    has n, :accounts
    has n, :wishlist_items
    # has n, :items, :through => :wishlist_items ## FIXME

    validates_presence_of :email_address
    validates_length_of   :email_address, :maximum => 255

    def last_order
      # TODO
    end

  end
end