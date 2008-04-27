class Role
  
  include DataMapper::Resource
  
  many_to_many  :users
  many_to_many  :rights, :order => 'name ASC'

  property :id,          Fixnum, :serial => true
  property :name,        String
  property :description, DataMapper::Types::Text

end