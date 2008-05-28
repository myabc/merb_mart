class Weight
  include DataMapper::Resource

  property :id,         Integer,     :serial => true
  property :min_weight, Float,      :default => 0.0, :nullable => false
  property :max_weight, Float,      :default => 0.0, :nullable => false
  property :price,      BigDecimal, :default => 0.0, :nullable => false
  property :shipping_info_id, Integer  # foreign-key

  has 1, :shipping_info
end