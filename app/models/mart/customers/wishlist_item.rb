module Mart
  module Customers
    class WishlistItem
  
      include DataMapper::Resource
      include DataMapper::Validate
  
      property :id,             Fixnum,  :serial => true
      property :created_on,     DateTime
      property :customer_id,    Fixnum  # foreign-key
      property :store_item_id,  Fixnum  # foreign-key
      
      belongs_to :customer
      belongs_to :store_item
      
    end
  end
end