module Mart
  module Store
    class Product < AbstractItem

      #has n, {:images => :product_images},
      #  :class_name => 'Mart::Store::ProductImage'#,
        #:order => :rank.desc

      has n, :variations, :order => [:name.asc]

      #many_to_many :related_products,
      #  :class_name => 'Product' #,
        #:join_table => 'related_products',
        #:association_foreign_key => 'related_id',
        #:foreign_key => 'product_id'

      #many_to_many :tags

    end
  end
end
