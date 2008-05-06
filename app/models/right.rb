class Right
  
  include DataMapper::Resource
  
  property :id,         Fixnum, :serial => true
  property :name,       String
  property :controller, String
  property :actions,    String

  many_to_many :roles

end