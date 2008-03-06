# Holds information about how the product varies.
#
class Variation < StoreItem
  
  belongs_to :product
  
  property :variation_quantity,  :integer, :default => 0, :nullable => false
  
end