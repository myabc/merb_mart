class OrderShippingType
  
  include DataMapper::Resource
  
  one_to_many :orders
  one_to_many :weights, :class => 'OrderShippingWeight', :dependent => :destroy

  attr_accessor :calculated_price

  property :id,          Fixnum, :serial => true
  property :name,        String, :length => 100,      :nullable => false
  property :code,        String, :length => 50
  property :is_domestic, TrueClass, :default => true, :nullable => false
  property :price,       Float,   :default => 0.0,    :nullable => false
  
  def self.get_domestic
    all(:is_domestic => true, :order => "price ASC")
  end

  def self.get_foreign
    all(:is_domestic => false, :order => "price ASC")
  end
  
end