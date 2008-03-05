class OrderAccountType < DataMapper::Base
  
  property :name, :string, :length => 30, :default => "", :nullable => false
  
end