module Mart
  class AbstractUpload
  
    include DataMapper::Resource
  
    IMAGE_EXTENSIONS = ['gif', 'jpg', 'jpeg', 'png', 'bmp']

    property :id,         Fixnum, :serial => true
    property :filename,   String
    property :width,      Fixnum, :default => 0, :nullable => false
    property :height,     Fixnum, :default => 0, :nullable => false
    property :created_on, DateTime
    #property :parent_id
    property :content_type, String
    property :thumbnail,    String
    property :size,         Fixnum
    property :type,       Class   # single-table inheritance

  end
end
