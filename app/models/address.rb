class Address

  include DataMapper::Resource
  include DataMapper::Validate

  property :first_name,   String, :length => 50, :nullable => false
  property :last_name,    String, :length => 50, :nullable => false
  property :company,      String, :length => 100
  property :telephone,    String, :length => 20
  property :address1,     String, :length => 200, :nullable => false
  property :address2,     String, :length => 200
  property :city,         String, :length => 50
  property :postal_code,  String, :length => 10 
  property :state_id,     Fixnum  # foreign-key
  property :country_code, String  # foreign-key

  belongs_to :state
  belongs_to :country

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :address1
  validates_presence_of :postal_code

  validates_length_of :first_name, :maximum => 50
  validates_length_of :last_name,  :maximum => 50
  validates_length_of :address1,   :maximum => 255

  alias :zipcode  :postal_code
  alias :zipcode= :postal_code=
  alias :province  :state
  alias :province= :state=

  def name
    "#{self.first_name} #{self.last_name}"
  end

end