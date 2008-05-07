module Mart
  module Store
    class Product < AbstractItem

      has n, :product_images
      has n, :variations #, :dependent => :destroy, :order => 'name ASC'
      #has n, :images #, ## FIXME
        #:through => :product_images,
        #:order => "-product_images.rank DESC",
        #:dependent => :destroy
  
      many_to_many :related_products,
        :class_name => 'Product' #,
        #:join_table => 'related_products',
        #:association_foreign_key => 'related_id',
        #:foreign_key => 'product_id'
  
      many_to_many :tags
  
    end
  end
end