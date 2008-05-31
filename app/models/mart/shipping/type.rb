require "bigdecimal"

module Mart
  module Shipping
    class Type

      include DataMapper::Resource

      attr_accessor :calculated_price

      property :id,          Integer,    :serial => true
      property :name,        String,    :length => 100,   :nullable => false
      property :code,        String,    :length => 50
      property :is_domestic, TrueClass, :default => true, :nullable => false
      property :price,       BigDecimal,:default => 0.0,  :nullable => false

      has n, :orders
      has n, :weights, :class_name => 'OrderShippingWeight' #, :dependent => :destroy

      def self.get_domestic
        all(:is_domestic => true, :order => "price ASC")
      end

      def self.get_foreign
        all(:is_domestic => false, :order => "price ASC")
      end

    end
  end
end
