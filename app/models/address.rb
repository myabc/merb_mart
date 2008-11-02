#
# A generic representation of an Address.
#
class Address
  include DataMapper::Resource

  property :id,           Integer,  :serial => true
  property :first_name,   String,   :length => 50, :nullable => false
  property :last_name,    String,   :length => 50, :nullable => false
  property :company,      String,   :length => 100
  property :telephone,    String,   :length => 20
  property :address1,     String,   :length => 200, :nullable => false
  property :address2,     String,   :length => 200
  property :city,         String,   :length => 50
  property :postal_code,  String,   :length => 10,  :nullable => false
  property :state_id,     Integer   # foreign-key
  property :country_code, String    # foreign-key

  belongs_to :state
  belongs_to :country, :through => :state
  belongs_to :customer

  alias :zipcode  :postal_code
  alias :zipcode= :postal_code=
  alias :province  :state
  alias :province= :state=

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
