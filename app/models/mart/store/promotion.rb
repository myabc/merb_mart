require "bigdecimal"
require 'dm-validations'

module Mart
  module Store
    class Promotion
  
      include DataMapper::Resource

      ## TODO: add support for subtypes:
      # - dollars off
      # - percetnage off
      # - buy n, get n free
      # - 
  
      property :id,               Fixnum,   :serial => true
      property :code,             String,   :length => 15,                  :nullable => false
      property :discount_type,    Fixnum,                 :default => 0,    :nullable => false
      property :discount_amount,  BigDecimal,              :default => 0.0,  :nullable => false
      property :start,            DateTime,                                 :nullable => false
      property :end,              DateTime,                                 :nullable => false
      property :minimum_cart_value, BigDecimal
      property :description,      String,                                   :nullable => false
      property :store_item_id,    Fixnum  # foreign-key

      has n, :orders
      belongs_to :item, :class_name => "Mart::Store::AbstractItem"
  
      validates_present   :code, :discount_amount, :discount_type, :description
      validates_is_number :discount_amount  

    end
  end
end