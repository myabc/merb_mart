class OrderStatusCode < DataMapper::Base
  
  has_many :orders
  
  property :name, :string, :length => 30, :nullable => false
  
end