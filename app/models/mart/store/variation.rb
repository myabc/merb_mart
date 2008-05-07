module Mart
  module Store
    class Variation < AbstractItem
  
      property :product_id, Fixnum  # foreign-key
  
      belongs_to :product

    end
  end
end