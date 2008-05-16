require "bigdecimal"

module Mart
  module Orders
    class LineItem

      include DataMapper::Resource

      property :id,         Fixnum,     :serial => true
      property :quantity,   Fixnum,     :default => 0,   :nullable => false
      property :unit_price, BigDecimal,  :default => 0.0, :nullable => false
      property :name,       String
      property :product_id, Fixnum    ## FIXME: should not be both product_id + store_item_id
      property :store_item_id, Fixnum # foreign-key

      belongs_to :product     ## FIXME: should not be both product_id + store_item_id
      belongs_to :store_item

    end
  end
end
