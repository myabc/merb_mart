class Order
  include DataMapper::Resource

  property :id,            Integer,  :serial => true
  property :order_number,  Integer,  :default => 0,   :nullable => false, :index => :unique
  property :created_on,    DateTime
  property :shipped_on,    DateTime
  property :notes,         DM::Text
  property :referer,       String
  property :product_cost,  BigDecimal,   :default => 0.0
  property :shipping_cost, BigDecimal,   :default => 0.0
  property :tax,           Float,        :default => 0.0, :nullable => false
  property :billing_address_id,     Integer     # foreign-key
  property :shipping_address_id,    Integer     # foreign-key
  property :account_id,             Integer     # foreign-key
  property :customer_id,            Integer     # foreign-key
  property :order_shipping_type_id, Integer     # foreign-key
  property :status_code_id,         Integer     # foreign-key
  property :promotion_id,           Integer     # foreign-key

  has 1..n, :line_items
  has 1,    :billing_address,  :class_name => 'Address' #, :foreign_key => 'billing_address_id'
  has 1,    :shipping_address, :class_name => 'Address' #, :foreign_key => 'shipping_address_id'

  has 1,    :account
  has 1,    :customer
  has 1,    :shipping_info
  has 0..1, :promotion

  attr_accessor :promotion_code
end