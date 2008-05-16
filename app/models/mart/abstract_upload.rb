module Mart
  class AbstractUpload

    include DataMapper::Resource

    property :id,           Fixnum, :serial => true
    property :filename,     String
    property :created_on,   DateTime
    property :content_type, String
    property :thumbnail,    String
    property :size,         Fixnum
    property :type,         Class   # single-table inheritance

    def filename_base
      filename.split('.').first
    end

    def extension
      filename.split('.').last
    end

    def relative_path
      filename # TODO
    end

  end
end
