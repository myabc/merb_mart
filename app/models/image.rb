# Represents an image
#
class Image < UserUpload

  one_to_many :product_images
  one_to_many :products, :through => :product_images

#  has_attachment :content_type => :image,
#                 :storage => :file_system,
#                 :max_size => MAX_SIZE,
#                 :thumbnails => { :thumb => '50x50>', :small => '200x200' },
#                 :processor => 'MiniMagick',
#                 :path_prefix => 'public/system/'
#
#  validates_as_attachment

end