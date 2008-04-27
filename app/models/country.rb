#
# A representation of a Country or dependent area, consisting of a name and
# ISO 3166-1 geographic code.
#
class Country
  
  include DataMapper::Resource
  
  property :code, String, :serial => true, :length => 2     # ISO 3166-1 alpha-2
  property :name, String, :length => 100, :nullable => false

end