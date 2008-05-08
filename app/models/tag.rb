require 'dm-validations'
#
# A free-form, flat taxonomoy.
#
class Tag
  
  include DataMapper::Resource
  include DataMapper::Validate
  
  property :id,         Fixnum, :serial => true
  property :name,       String, :length => 100, :nullable => false, :key => :unique
  property :rank,       Fixnum
  
  validates_presence_of   :name
  validates_uniqueness_of :rank
  
  def self.all_ordered
    all(:order => [ :name.asc ])
  end
  
end