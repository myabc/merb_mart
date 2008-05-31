require "bigdecimal"

module Mart
  module Orders
    class LineItem

      include DataMapper::Resource

      property :id,         Integer,     :serial => true
      property :quantity,   Integer,     :default => 0,   :nullable => false
      property :unit_price, BigDecimal,  :default => 0.0, :nullable => false
      property :name,       String
      property :product_id, Integer    ## FIXME: should not be both product_id + store_item_id
      property :store_item_id, Integer # foreign-key

      belongs_to :product     ## FIXME: should not be both product_id + store_item_id
      belongs_to :store_item

    end
  end
end
