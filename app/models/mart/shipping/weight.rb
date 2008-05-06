module Mart
  module Shipping
    class Weight
  
      include DataMapper::Resource
  
      property :id,         Fixnum, :serial => true
      property :min_weight, Float, :default => 0.0, :nullable => false
      property :max_weight, Float, :default => 0.0, :nullable => false
      property :price,      Float, :default => 0.0, :nullable => false
      property :order_shipping_type_id, Fixnum  # foreign-key

      many_to_one :order_shipping_type
  
    end
  end
end