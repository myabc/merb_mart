class Order
  include DataMapper::Resource

  property :id,            Integer, :serial => true
  property :order_number,  Integer, :nullable => false, :index => :unique
  property :created_on,    DateTime
  property :shipped_on,    DateTime
  property :notes,         DM::Text
  property :referer,       String
  property :product_cost,  BigDecimal, :nullable => false
  property :shipping_cost, BigDecimal, :nullable => false
  property :tax,           BigDecimal, :nullable => false
  property :customer_id,            Integer     # foreign-key
  property :order_shipping_type_id, Integer     # foreign-key
  property :shipping_info_id,       Integer     # foreign-key
  property :promotion_id,           Integer     # foreign-key

  belongs_to  :customer
  belongs_to  :shipping_info

  has 1..n,   :line_items
  has 1..n,   :transactions

  validates_present :customer, :line_items, :shipping_info
end
