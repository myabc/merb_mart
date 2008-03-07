# Represents a connection from an image to a product.
#
#
class ProductImage
  
  include DataMapper::Persistable
  
  belongs_to :product
  belongs_to :image
  
  property :rank, :integer
  
end