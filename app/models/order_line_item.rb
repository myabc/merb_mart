class OrderLineItem
  
  include DataMapper::Resource
  
  many_to_one :product
  many_to_one :store_item
  
  property :id,         Fixnum,  :serial => true
  property :quantity,   Fixnum,  :default => 0,   :nullable => false
  property :unit_price, Float,   :default => 0.0, :nullable => false
  property :name,       String
  
end