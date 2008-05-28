class Customer < User
  has n, :orders
  has n, :addresses
  has n, :accounts
end