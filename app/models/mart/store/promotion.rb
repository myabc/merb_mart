require 'dm-validations'

module Mart
  module Store
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
      property :store_item_id,    Fixnum  # foreign-key

      has n, :orders
      belongs_to :item, :class_name => "Mart::Store::AbstractItem"
  
      validates_presence_of :code, :discount_amount, :discount_type, :description
      validates_numericalnes_of :discount_amount  

    end
  end
end