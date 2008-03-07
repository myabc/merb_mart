class OrderAccountType
  
  include DataMapper::Persistable
  
  property :name, :string, :length => 30, :default => "", :nullable => false
  
end