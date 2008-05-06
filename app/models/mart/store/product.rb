module Mart
  module Store
    class Product < AbstractItem

      one_to_many :product_images
      one_to_many :variations #, :dependent => :destroy, :order => 'name ASC'
      one_to_many :images #, 
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