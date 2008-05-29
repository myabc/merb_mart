class Upload
  include DataMapper::Resource
  include Merb::Slices::config[:merb_E_mart][:upload_processor_mixin]

  property :id,         Integer, :serial => true
  property :type,       Class    # single-table inheritance
  property :location,   DM::URI, :nullable => false

  before :save, :process
end