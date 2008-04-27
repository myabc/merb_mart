require 'validate'

class Promotion
  
  include DataMapper::Resource
  include DataMapper::Validate

  TYPES = {
    'Dollars' => 0,
    'Percent of total order' => 1,
    'Buy [n] get 1 free' => 2
  }
  
  property :id,               Fixnum,   :serial => true
  property :code,             String,   :length => 15,                  :nullable => false
  property :discount_type,    Fixnum,                  :default => 0,   :nullable => false
  property :discount_amount,  Float,                   :default => 0.0, :nullable => false
  property :start,            DateTime,                                 :nullable => false
  property :end,              DateTime,                                 :nullable => false
  property :minimum_cart_value, Float
  property :description,      String,                                   :nullable => false

  one_to_many :orders
  many_to_one :item
  
  validates_presence_of :code, :discount_amount, :discount_type, :description
  validates_numericalnes_of :discount_amount  
  
end