class Variation < StoreItem
  
  property :product_id, Fixnum  # foreign-key
  
  many_to_one :product

end