# Represents a connection from an image to a product.
#
#
class ProductImage
  
  include DataMapper::Resource
  
  many_to_one :product
  many_to_one :image
  
  property :rank, Fixnum
  
end