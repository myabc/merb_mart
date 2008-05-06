require 'validate'

module Mart
  class Order
  
    include DataMapper::Resource
    include DataMapper::Validate

    property :id,            Fixnum,  :serial => true
    property :order_number,  Fixnum,  :default => 0,   :nullable => false, :index => :unique
    property :created_on,    DateTime
    property :shipped_on,    DateTime
    property :notes,         DataMapper::Types::Text
    property :referer,       String
    property :product_cost,  Float,   :default => 0.0
    property :shipping_cost, Float,   :default => 0.0
    property :tax,           Float,   :default => 0.0, :nullable => false
    property :billing_address_id, Fixnum      # foreign-key
    property :shipping_address_id, Fixnum     # foreign-key
    property :account_id,    Fixnum           # foreign-key
    property :customer_id,   Fixnum           # foreign-key
    property :order_shipping_type_id, Fixnum  # foreign-key
    property :status_code_id,Fixnum           # foreign-key
    property :promotion_id,  Fixnum           # foreign-key
  
    one_to_many :line_items,      :class_name => 'Orders::LineItem' #, :dependent => :destroy
  
    one_to_one :billing_address,  :class_name => 'Address' #, :foreign_key => 'billing_address_id'
    one_to_one :shipping_address, :class_name => 'Address' #, :foreign_key => 'shipping_address_id'
  
    many_to_one :account
    many_to_one :customer
    many_to_one :order_shipping_type
    many_to_one :status_code,     :class_name => 'Orders::StatusCode'
    many_to_one :promotion
  
    attr_accessor :promotion_code
  
    validates_presence_of   :order_number
  
  end
end