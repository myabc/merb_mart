class Variation < Product
  property :product_id, Integer  # foreign-key

  belongs_to :product
end
