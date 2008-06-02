class Item
  include DataMapper::Resource

  property :id,         Integer, :serial => true
  property :type,       Class    # single-table inheritance
  property :name,       String
  property :product_id, Integer  # foreign-key

  belongs_to :product

  validates_present :product
end
