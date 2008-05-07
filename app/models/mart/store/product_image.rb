module Mart
  module Store
    class ProductImage
  
      include DataMapper::Resource
  
      property :product_id, Fixnum  # foreign-key
      property :image_id,   Fixnum  # foreign-key
      property :rank,       Fixnum

      belongs_to :product
      belongs_to :image

    end
  end
end