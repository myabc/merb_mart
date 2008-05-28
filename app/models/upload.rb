class Upload
  include DataMapper::Resource

  property :id,         Integer, :serial => true
  property :type,       Class    # single-table inheritance
  property :filename,   String
end