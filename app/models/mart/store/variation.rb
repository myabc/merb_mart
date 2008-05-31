module Mart
  module Store
    class Variation < AbstractItem

      property :product_id, Integer  # foreign-key

      belongs_to :product

    end
  end
end
