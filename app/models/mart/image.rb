module Mart
  class Image < AbstractUpload

    IMAGE_EXTENSIONS = ['gif', 'jpg', 'jpeg', 'png', 'bmp']

    property :width,      Fixnum, :default => 0, :nullable => false
    property :height,     Fixnum, :default => 0, :nullable => false

    has n, :product_images
    #has n, :products, :through => :product_images ## FIXME

  end
end
