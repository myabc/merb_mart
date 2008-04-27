class AccountType
  
  include DataMapper::Resource
  
  property :id,   Fixnum, :serial => true
  property :name, String, :length => 30, :nullable => false
  
end