class WishlistItem
  
  include DataMapper::Resource
  
  property :id,         Fixnum,  :serial => true
  property :created_on, DateTime

  many_to_one :order_user
  many_to_one :item

end