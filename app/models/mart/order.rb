require "bigdecimal"
require 'dm-validations'

module Mart
  class Order

    include DataMapper::Resource

    property :id,            Fixnum,  :serial => true
    property :order_number,  Fixnum,  :default => 0,   :nullable => false, :index => :unique
    property :created_on,    DateTime
    property :shipped_on,    DateTime
    property :notes,         DataMapper::Types::Text
    property :referer,       String
    property :product_cost,  BigDecimal,   :default => 0.0
    property :shipping_cost, BigDecimal,   :default => 0.0
    property :tax,           Float,        :default => 0.0, :nullable => false
    property :billing_address_id, Fixnum      # foreign-key
    property :shipping_address_id, Fixnum     # foreign-key
    property :account_id,    Fixnum           # foreign-key
    property :customer_id,   Fixnum           # foreign-key
    property :order_shipping_type_id, Fixnum  # foreign-key
    property :status_code_id,Fixnum           # foreign-key
    property :promotion_id,  Fixnum           # foreign-key

    has 1..n, :line_items,       :class_name => 'Orders::LineItem' #, :dependent => :destroy
    has 1,    :billing_address,  :class_name => 'Address' #, :foreign_key => 'billing_address_id'
    has 1,    :shipping_address, :class_name => 'Address' #, :foreign_key => 'shipping_address_id'

    belongs_to :account
    belongs_to :customer
    belongs_to :order_shipping_type
    belongs_to :status_code,     :class_name => 'Orders::StatusCode'
    belongs_to :promotion

    attr_accessor :promotion_code

    validates_present :order_number

  end
end
