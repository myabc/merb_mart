module Mart
  class Image < AbstractUpload

    one_to_many :product_images
    one_to_many :products #, :through => :product_images

  end
end