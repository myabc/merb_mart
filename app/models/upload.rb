class Upload
  include DataMapper::Resource

  property :id,         Integer, :serial => true
  property :type,       Class    # single-table inheritance
  property :location,   DM::URI, :nullable => false

  before :save, :process

  def process; end
end