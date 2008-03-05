class Order < DataMapper::Base
  
  has_many :order_line_items, :dependent => :destroy
  # billing_address defined as a method!
  #belongs_to :billing_address, 
  #  :class_name => 'OrderAddress',
  #  :foreign_key => 'billing_address_id'
  #belongs_to :shipping_address,
  #  :class_name => 'OrderAddress',
  #  :foreign_key => 'shipping_address_id'
  
  belongs_to :order_account
  belongs_to :order_user
  belongs_to :order_shipping_type
  belongs_to :order_status_code
  #belongs_to :promotion
  
  property :order_number,  :integer,  :default => 0,   :nullable => false, :index => :unique
  property :created_on,    :datetime
  property :shipped_on,    :datetime
  property :notes,         :text
  property :referer,       :string
  property :product_cost,  :float,    :default => 0.0
  property :shipping_cost, :float,    :default => 0.0
  property :tax,           :float,    :default => 0.0, :nullable => false

  #property t.integer  :order_user_id"
  #property t.integer  :order_status_code_id",   :default => 1,   :null => false
  #property t.integer  :order_shipping_type_id", :default => 1,   :null => false
  #property t.string   :auth_transaction_id"
  #property t.integer  :promotion_id",           :default => 0,   :null => false
  #property t.integer  :shipping_address_id",    :default => 0,   :null => false
  #property t.integer  :billing_address_id",     :default => 0,   :null => false
  #property t.integer  :order_account_id",       :default => 0,   :null => false
  
  #validates_presence_of   :order_number
  #validates_uniqueness_of :order_number
  
end