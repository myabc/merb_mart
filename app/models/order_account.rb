class OrderAccount < DataMapper::Base
  
  has_one :order_account_type
  has_one :order
  #belongs_to :order_user
  
  #property "order_user_id",                       :default => 0, :null => false
  #property "order_account_type_id",               :default => 1, :null => false
  property :cc_number,        :string
  property :account_number,   :string
  property :expiration_month, :integer, :length => 2
  property :expiration_year,  :integer, :length => 4
  property :credit_ccv,       :integer, :length => 5
  property :routing_number,   :string,  :length => 20
  property :bank_name,        :string,  :length => 50

end