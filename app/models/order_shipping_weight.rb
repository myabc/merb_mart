# These are the "variations" of an OrderShippingType
#
# They allow an admin to specify weight ranges and prices
# for an OrderShippingType.
#
class OrderShippingWeight < DataMapper::Base
  
  belongs_to :order_shipping_type
  
  property :min_weight, :float, :default => 0.0, :nullable => false
  property :max_weight, :float, :default => 0.0, :nullable => false
  property :price,      :float, :default => 0.0, :nullable => false
  
end