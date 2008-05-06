module Mart
  module Store
    class Variation < AbstractItem
  
      property :product_id, Fixnum  # foreign-key
  
      many_to_one :product

    end
  end
end