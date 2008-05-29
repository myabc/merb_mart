class Account
  include DataMapper::Resource

  property :id,           Integer, :serial => true
  property :type,         Class    # single-table inheritance
  property :address_id,   Integer  # foreign-key

  has n,  :transactions
  belongs_to :address, :class_name => 'Address' #stupid DM, tries to singularize a 'has 1'

  validates_present :address
end