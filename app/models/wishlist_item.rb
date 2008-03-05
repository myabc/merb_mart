# Items that make up a customer's wishlist.
#
class WishlistItem < DataMapper::Base
  
  belongs_to :order_user
  belongs_to :item
  
  property :created_on, :datetime
  
end