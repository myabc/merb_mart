require 'validate'

class Order
  
  include DataMapper::Resource
  include DataMapper::Validate
  
  one_to_many :order_line_items, :dependent => :destroy
  
  one_to_one :billing_address,  :class => 'OrderAddress', :foreign_key => 'billing_address_id'
  one_to_one :shipping_address, :class => 'OrderAddress', :foreign_key => 'shipping_address_id'
  
  many_to_one :order_account
  many_to_one :order_user
  many_to_one :order_shipping_type
  many_to_one :order_status_code
  many_to_one :promotion
  
  attr_accessor :promotion_code
  
  property :id,            Fixnum,  :serial => true
  property :order_number,  Fixnum,  :default => 0,   :nullable => false, :index => :unique
  property :created_on,    DateTime
  property :shipped_on,    DateTime
  property :notes,         DataMapper::Types::Text
  property :referer,       String
  property :product_cost,  Float,   :default => 0.0
  property :shipping_cost, Float,   :default => 0.0
  property :tax,           Float,   :default => 0.0, :nullable => false

  
  validates_presence_of   :order_number
 
  
end