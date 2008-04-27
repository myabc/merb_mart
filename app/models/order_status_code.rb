class OrderStatusCode
  
  include DataMapper::Resource
  
  one_to_many :orders
  
  property :id,   Fixnum, :serial => true
  property :name, String, :length => 30, :nullable => false
  
end