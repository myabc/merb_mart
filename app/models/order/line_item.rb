module Mart
  module Orders
    class LineItem
  
      include DataMapper::Resource

      property :id,         Fixnum,  :serial => true
      property :quantity,   Fixnum,  :default => 0,   :nullable => false
      property :unit_price, Float,   :default => 0.0, :nullable => false
      property :name,       String
      property :product_id, Fixnum    ## FIXME: should not be both product_id + store_item_id
      property :store_item_id, Fixnum # foreign-key
  
      many_to_one :product     ## FIXME: should not be both product_id + store_item_id
      many_to_one :store_item
  
    end
  end
end