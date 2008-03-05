# Represents a connection from an image to a product.
#
#
class ProductImage < DataMapper::Base
  
  belongs_to :product
  belongs_to :image
  
  property :rank, :integer
  
end