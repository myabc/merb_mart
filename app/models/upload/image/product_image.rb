class ProductImage < Image
  property :product_id, Integer  # foreign-key

  has 1, :product
end