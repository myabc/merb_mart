require 'dm-validations'
#
# A free-form, flat taxonomoy.
#
class Tag
  
  include DataMapper::Resource
  
  property :id,         Fixnum, :serial => true
  property :name,       String, :length => 100, :nullable => false, :key => :unique
  property :rank,       Fixnum
  
  validates_present   :name
  validates_is_unique :rank
  
  def self.all_ordered
    all(:order => [ :name.asc ])
  end
  
end