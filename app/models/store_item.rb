# This is the base model for Product and ProductVariation.
#
require "date"

class StoreItem

  include DataMapper::Resource

  #has_many :order_line_items
  #has_many :wishlist_items, :dependent => :destroy

  property :id,             Fixnum, :serial => true
  property :code,           String, :length => 20,  :default => "",    :nullable => false
  property :name,           String, :length => 100, :default => "",    :nullable => false
  property :description,    DataMapper::Types::Text
  property :price,          Float,                   :default => 0.0,   :nullable => false
  property :date_available, DateTime,                                   :nullable => false
  property :quantity,       Fixnum,                 :default => 0,     :nullable => false
  property :size_width,     Float,                   :default => 0.0,   :nullable => false
  property :size_height,    Float,                   :default => 0.0,   :nullable => false
  property :size_depth,     Float,                   :default => 0.0,   :nullable => false
  property :weight,         Float,                   :default => 0.0,   :nullable => false
  property :is_discontinued, TrueClass,                 :default => false, :nullable => false
                            # Boolean?
  
  property :type,           Class    # enable single-table inheritence
  
  #t.integer  "product_id",                        :default => 0,     :null => false

  # FIXME
  #add_index ["quantity", "is_discontinued", "variation_quantity"], :name => "published"
  #add_index ["product_id", "type"], :name => "variation"
  #add_index ["date_available", "is_discontinued", "quantity", "variation_quantity", "type"], :name => "tag_view"
  #add_index ["name", "code", "is_discontinued", "date_available", "quantity", "variation_quantity", "type"], :name => "search"

  # FIXME
  #validates_presence_of :name, :code
  #validates_uniqueness_of :code
  
  #############################################################################
  # CALLBACKS
  #############################################################################
  
  
  #############################################################################
  # CLASS METHODS
  #############################################################################
  
  def find_by_code(code)
    first(:code => code)
  end
  
  # Name output for product suggestion JS
  # 
  def suggestion_name
    "#{self.code}: #{self.name}"
  end

end