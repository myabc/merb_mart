class OrderStatusCode
  
  include DataMapper::Resource
  
  property :id,   Fixnum, :serial => true
  property :name, String, :length => 30, :nullable => false
  
  one_to_many :orders
  
end