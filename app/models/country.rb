class Country
  
  include DataMapper::Resource
  
  property :id,         Fixnum, :serial => true
  property :name,       String, :length => 100, :nullable => false
  property :fedex_code, String, :length => 50
  property :ufsi_code,  String, :length => 3
  
  # TODO: not really a normalized way of doing things? should we keep this?
  property :number_of_orders, Fixnum, :default => 0, :index => true

end