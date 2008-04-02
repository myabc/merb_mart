class OrderAccountType
  
  include DataMapper::Resource
  
  property :id,   Fixnum, :serial => true
  property :name, String, :length => 30, :default => "", :nullable => false
  
end