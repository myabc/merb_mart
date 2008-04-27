class Country
  
  include DataMapper::Resource
  
  property :id,         Fixnum, :serial => true
  property :name,       String, :length => 100, :nullable => false
  property :fedex_code, String, :length => 50
  property :ufsi_code,  String, :length => 3

end