class Account
  include DataMapper::Resource

  property :id,           Integer, :serial => true
  property :type,         Class    # single-table inheritance
  property :order_id,     Integer  # foreign-key
  property :customer_id,  Integer  # foreign-key

  has 0..1, :order
  belongs_to :customer
end