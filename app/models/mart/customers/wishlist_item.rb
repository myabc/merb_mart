module Mart
  module Customers
    class WishlistItem

      include DataMapper::Resource
      include DataMapper::Validate

      property :id,             Integer,  :serial => true
      property :created_on,     DateTime
      property :customer_id,    Integer  # foreign-key
      property :store_item_id,  Integer  # foreign-key

      belongs_to :customer
      belongs_to :store_item

    end
  end
end
