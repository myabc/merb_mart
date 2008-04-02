# Items that make up a customer's wishlist.
#
class WishlistItem
  
  include DataMapper::Resource
  
  #belongs_to :order_user
  #belongs_to :item
  
  property :id,         Fixnum,  :serial => true
  property :created_on, DateTime
  
end