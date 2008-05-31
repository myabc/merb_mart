class ShippingInfo
  include DataMapper::Resource

  attr_accessor :calculated_price

  property :id,           Integer,     :serial => true
  property :name,         String,      :length => 100,   :nullable => false
  property :code,         String,      :length => 50
  property :is_domestic,  Boolean,     :default => true, :nullable => false
  property :price,        BigDecimal,  :default => 0.0,  :nullable => false
  property :address_id,   Integer

  has n, :orders
  has n, :weights
  belongs_to :address, :class_name => 'Address'
end