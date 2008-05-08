#
# A representation of a Country or dependent area, consisting of a name and
# ISO 3166-1 geographic code.
#
class Country
  
  include DataMapper::Resource
  include DataMapper::Validate
  
  property :code, String, :key => true, :length => 2     # ISO 3166-1 alpha-2
  property :name, String, :length => 100,  :nullable => false, :unique => true

  has n, :states

  validates_presence_of   :name
  validates_uniqueness_of :name

  alias :provinces :states

end