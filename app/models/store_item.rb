# This is the base model for Product and ProductVariation.
#
class StoreItem

  include DataMapper::Persistable

  has_many :order_line_items
  has_many :wishlist_items, :dependent => :destroy

  property :code,           :string,  :length => 20,  :default => "",    :nullable => false
  property :name,           :string,  :length => 100, :default => "",    :nullable => false
  property :description,    :text
  property :price,          :float,                   :default => 0.0,   :nullable => false
  property :date_available, :datetime,                                   :nullable => false
  property :quantity,       :integer,                 :default => 0,     :nullable => false
  property :size_width,     :float,                   :default => 0.0,   :nullable => false
  property :size_height,    :float,                   :default => 0.0,   :nullable => false
  property :size_depth,     :float,                   :default => 0.0,   :nullable => false
  property :weight,         :float,                   :default => 0.0,   :nullable => false
  property :is_discontinued,:boolean,                 :default => false, :nullable => false
  
  #t.string   "type",              :string, :limit => 40  -- handled by DM
  #t.integer  "product_id",                        :default => 0,     :null => false

  #add_index ["quantity", "is_discontinued", "variation_quantity"], :name => "published"
  #add_index ["product_id", "type"], :name => "variation"
  #add_index ["date_available", "is_discontinued", "quantity", "variation_quantity", "type"], :name => "tag_view"
  #add_index ["name", "code", "is_discontinued", "date_available", "quantity", "variation_quantity", "type"], :name => "search"

  #validates_presence_of :name, :code
  validates_uniqueness_of :code
  
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