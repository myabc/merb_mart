module Mart
  module Store
    class ProductImage

      include DataMapper::Resource

      property :product_id, Integer  # foreign-key
      property :image_id,   Integer  # foreign-key
      property :rank,       Integer

      belongs_to :product, :class_name => 'Mart::Store::Product'
      belongs_to :image,   :class_name => 'Mart::Image'

    end
  end
end
