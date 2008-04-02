# Items that make up a customer's wishlist.
#
class WishlistItem
  
  include DataMapper::Resource
  
  many_to_one :order_user
  many_to_one :item
  
  property :id,         Fixnum,  :serial => true
  property :created_on, DateTime
  
end