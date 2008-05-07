#
# A representation of a State or Province (e.g. New York/NY, Alberta, Northern
# Ireland, etc.) for those countries that use them as an administrative 
# division.
#
class State

  include DataMapper::Resource

  property :id,           Fixnum, :serial => true
  property :abbr,         String, :length => 10
  property :name,         String, :length => 50, :nullable => false
  property :country_code, String  # foreign-key
  
  belongs_to :country
  
end