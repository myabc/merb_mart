class OrderShippingType < DataMapper::Base
  
  has_many :orders
  #has_many :weights,
  #:class_name => 'OrderShippingWeight',
  #:dependent => :destroy
  
  property :name,        :string, :length => 100, :default => "", :nullable => false
  property :code,        :string, :length => 50
  property :is_domestic, :boolean, :default => true, :nullable => false
  property :price,       :float,   :default => 0.0,  :nullable => false
  
end