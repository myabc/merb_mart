require 'validate'

class Customer
  
  include DataMapper::Resource
  include DataMapper::Validate
  
  property :id,            Fixnum,  :serial => true
  property :username,      String,  :length => 50
  property :email_address, String,  :length => 50, :nullable => false, :index => :unique
  property :password,      String,  :length => 20
  property :created_on,    DateTime
  property :first_name,    String,  :length => 50, :nullable => false
  property :last_name,     String,  :length => 50, :nullable => false

  one_to_many :orders #,
    #:dependent => :nullify,
    #:order => "created_on DESC"
  one_to_many :last_order#,
    #:class_name => "Order",
    #:order => "created_on DESC"
  one_to_many :order_addresses #, :dependent => :destroy
  one_to_many :order_accounts  #, :dependent => :destroy
  
  one_to_many :wishlist_items #, 
    #:dependent => :destroy,
    #:order => "created_on DESC"
  one_to_many :items #, :through => :wishlist_items,
    #:order => "wishlist_items.created_on DESC"

  validates_presence_of :email_address
  #validates_length_of :email_address, :maximum => 255

end