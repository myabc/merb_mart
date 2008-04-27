require "date"
require "validate"

class StoreItem

  include DataMapper::Resource
  include DataMapper::Validate

  property :id,             Fixnum, :serial => true
  property :code,           String, :length => 20,                      :nullable => false
  property :name,           String, :length => 100,                     :nullable => false
  property :description,    DataMapper::Types::Text
  property :price,          Float,                  :default => 0.0,    :nullable => false
  property :date_available, DateTime,                                   :nullable => false
  property :quantity,       Fixnum,                 :default => 0,      :nullable => false
  property :size_width,     Float,                  :default => 0.0,    :nullable => false
  property :size_height,    Float,                  :default => 0.0,    :nullable => false
  property :size_depth,     Float,                  :default => 0.0,    :nullable => false
  property :weight,         Float,                  :default => 0.0,    :nullable => false
  property :is_discontinued, TrueClass,             :default => false,  :nullable => false
  
  property :type,           Class    # enable single-table inheritance

  one_to_many :order_line_items
  one_to_many :wishlist_items, :dependent => :destroy

  validates_presence_of :name, :code

end