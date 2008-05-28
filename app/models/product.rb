class Product
  include DataMapper::Resource

  property :id,               Integer,  :serial => true
  property :type,             Class    # single-table inheritance
  property :code,             String,   :length => 20,                      :nullable => false
  property :name,             String,   :length => 100,                     :nullable => false
  property :description,      DM::Text
  property :price,            BigDecimal,             :default => 0.0,      :nullable => false
  property :date_available,   DateTime,                                     :nullable => false
  property :quantity,         Integer,                :default => 0,        :nullable => false
  property :size_width,       Float,                  :default => 0.0,      :nullable => false
  property :size_height,      Float,                  :default => 0.0,      :nullable => false
  property :size_depth,       Float,                  :default => 0.0,      :nullable => false
  property :weight,           Float,                  :default => 0.0,      :nullable => false
  property :is_discontinued,  Boolean,                :default => false

  has n, :items
  has n, :variations
  has n, :product_images

  validates_present :name, :code
end