class Image < Upload
  include Merb::Slices::config[:merb_E_mart][:image_resize_mixin]

  IMAGE_EXTENSIONS = ['gif', 'jpg', 'jpeg', 'png', 'bmp']

  property :width,      Integer
  property :height,     Integer

  validates_present :width, :height

  after :process, :resize
end