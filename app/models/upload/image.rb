class Image < Upload

  IMAGE_EXTENSIONS = ['gif', 'jpg', 'jpeg', 'png', 'bmp']

  property :width,      Integer
  property :height,     Integer

  validates_present :width, :height

  after :process, :resize

  def resize; end
end