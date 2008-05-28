class User
  include DataMapper::Resource

  property :id, Integer, :serial => true
  property :username,      String, :length => 50, :nullable => false, :unique => true
  property :created_on,    DateTime
end