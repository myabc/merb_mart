class Weight
  include DataMapper::Resource

  property :id,         Integer,    :serial => true
  property :min_weight, Float,      :nullable => false
  property :max_weight, Float,      :nullable => false
  property :price,      BigDecimal, :nullable => false
  property :shipping_info_id, Integer  # foreign-key

  belongs_to :shipping_info
end