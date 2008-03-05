class OrderAddress < DataMapper::Base
  
  has_one :order
  #belongs_to :order_user
  belongs_to :country
  
  #t.integer "order_user_id",               :default => 0,  :null => false
  
  property :first_name, :string, :length => 50, :default => "", :nullable => false
  property :last_name,  :string, :length => 50, :default => "", :nullable => false
  property :telephone,  :string, :length => 20
  property :address,    :string,                :default => "", :nullable => false
  property :city,       :string, :length => 50
  property :state,      :string, :length => 30
  property :zip,        :string, :length => 10  
  
  # Validation
  #validates_presence_of :order_user_id, :country_id
  #validates_presence_of :zip, :message => "#{ERROR_EMPTY} If you live in a country that doesn't have postal codes please enter '00000'."
  #validates_presence_of :telephone, :message => ERROR_EMPTY
  #validates_presence_of :first_name, :message => ERROR_EMPTY
  #validates_presence_of :last_name, :message => ERROR_EMPTY
  #validates_presence_of :address, :message => ERROR_EMPTY
  
  #validates_length_of :first_name, :maximum => 50
  #validates_length_of :last_name, :maximum => 50
  #validates_length_of :address, :maximum => 255
  
end