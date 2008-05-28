class Image < Upload
  IMAGE_EXTENSIONS = ['gif', 'jpg', 'jpeg', 'png', 'bmp']

  property :width,      Integer, :default => 0, :nullable => false
  property :height,     Integer, :default => 0, :nullable => false
end