class Customer
  include DataMapper::Resource

  property :username,      String, :length => 50, :nullable => false, :unique => true
  property :created_on,    DateTime

  has n, :orders
  has n, :addresses
  has n, :accounts
end