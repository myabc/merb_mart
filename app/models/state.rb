#
# A representation of a State, Province, or sub-national administrative
# division, for those countries that use such administrative divisions.
#
# Useful for the purposes of addresses, local taxation purposes, etc.
#
# e.g.
#   US State                          => New York/NY
#   Canadian Province                 => Alberta/AB
#   UK Province/Constituent Country   => Northern Ireland
#   German Bundesland                 => Baden-Württemburg/BW
#
class State

  include DataMapper::Resource

  property :id,           Fixnum, :serial => true
  property :abbr,         String, :length => 10
  property :name,         String, :length => 50, :nullable => false
  property :country_code, String  # foreign-key
  
  ## TODO   country_code and abbr a composite-key
  
  belongs_to :country
  
end