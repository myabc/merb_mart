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

  property :country_code, String, :key => true  # foreign-key, ISO 3166-1 alpha-2
  property :abbr,         String, :key => true, :length => 10
  property :name,         String,               :length => 50, :nullable => false

  belongs_to :country
end
