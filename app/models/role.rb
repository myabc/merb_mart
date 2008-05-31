class Role

  include DataMapper::Resource

  property :id,          Integer, :serial => true
  property :name,        String
  property :description, DataMapper::Types::Text

  #many_to_many :users
  #many_to_many :rights #, :order => 'name ASC'

end
