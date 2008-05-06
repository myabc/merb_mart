class ProductImage
  
  include DataMapper::Resource
  
  property :product_id, Fixnum  # foreign-key
  property :image_id,   Fixnum  # foreign-key
  property :rank,       Fixnum

  many_to_one :product
  many_to_one :image

end