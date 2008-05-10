require "bigdecimal"
require "date"
require "dm-validations"

module Mart
  module Store
    class AbstractItem

      include DataMapper::Resource

      property :id,             Fixnum, :serial => true
      property :code,           String, :length => 20,                      :nullable => false
      property :name,           String, :length => 100,                     :nullable => false
      property :description,    DataMapper::Types::Text
      property :price,          BigDecimal,             :default => 0.0,    :nullable => false
      property :date_available, DateTime,                                   :nullable => false
      property :quantity,       Fixnum,                 :default => 0,      :nullable => false
      property :size_width,     Float,                  :default => 0.0,    :nullable => false
      property :size_height,    Float,                  :default => 0.0,    :nullable => false
      property :size_depth,     Float,                  :default => 0.0,    :nullable => false
      property :weight,         Float,                  :default => 0.0,    :nullable => false
      property :is_discontinued, TrueClass,             :default => false
      property :type,           Class    # single-table inheritance
      
      has n, :line_items,     :class_name => "Mart::Orders::LineItem"
      has n, :wishlist_items, :class_name => "Mart::Customers::WishlistItem" #, :dependent => :destroy
      
      validates_present :name, :code
      
    end
  end
end