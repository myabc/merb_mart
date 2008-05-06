class WishlistItem
  
  include DataMapper::Resource
  include DataMapper::Validate
  
  property :id,         Fixnum,  :serial => true
  property :created_on, DateTime

  many_to_one :order_user
  many_to_one :item

end