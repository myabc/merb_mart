# These are the "variations" of an OrderShippingType
#
# They allow an admin to specify weight ranges and prices
# for an OrderShippingType.
#
class OrderShippingWeight
  
  include DataMapper::Resource
  
  many_to_one :order_shipping_type

  property :id,         Fixnum, :serial => true
  property :min_weight, Float, :default => 0.0, :nullable => false
  property :max_weight, Float, :default => 0.0, :nullable => false
  property :price,      Float, :default => 0.0, :nullable => false
  
end