class OrderUser < DataMapper::Base
  
  has_many :orders,
    :dependent => :nullify,
    :order => "created_on DESC"
  has_one :last_order,
    :class_name => "Order",
    :order => "created_on DESC"
  has_many :order_addresses, :dependent => :destroy
  has_many :order_accounts, :dependent => :destroy
  
  has_many :wishlist_items, 
    :dependent => :destroy,
    :order => "created_on DESC"
  has_many :items, :through => :wishlist_items,
    :order => "wishlist_items.created_on DESC"
  
  property :username,      :string,   :length => 50
  property :email_address, :string,   :length => 50, :default => "", :nullable => false, :index => :unique
  property :password,      :string,   :length => 20
  property :created_on,    :datetime
  property :first_name,    :string,   :length => 50, :default => "", :nullable => false
  property :last_name,     :string,   :length => 50, :default => "", :nullable => false

  #validates_presence_of :email_address, :message => ERROR_EMPTY
	#validates_length_of :email_address, :maximum => 255
	#validates_uniqueness_of :email_address, 
	#  :message => %q/
	#    This email address has already been taken in our system.<br\/>
	#    If you have already ordered with us, please login.
	#  /
	#validates_format_of :email_address,
	#                    :with => /^([^@\s]+)@((?:[-a-zA-Z0-9]+\.)+[a-zA-Z]{2,})$/,
	#                    :message => "Please enter a valid email address."

end