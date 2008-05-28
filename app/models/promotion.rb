class Promotion
  include DataMapper::Resource

  ## TODO: add support for subtypes:
  # - dollars off
  # - percetnage off
  # - buy n, get n free
  # -

  property :id,                 Integer,                  :serial => true
  property :code,               String,                   :length => 15,                :nullable => false
  property :discount_amount,    BigDecimal,               :default => 0.0,              :nullable => false
  property :start,              DateTime,                                               :nullable => false
  property :end,                DateTime,                                               :nullable => false
  property :minimum_cart_value, BigDecimal
  property :discount_type,      DM::Enum[:dollars_off, :percentage_off, :buy_n_get_n],  :nullable => false
  property :description,        String,                                                 :nullable => false
  property :store_item_id,      Integer  # foreign-key

  has n, :orders
  has 1..n, :products

  validates_is_number :discount_amount, :greated_than => 0.0
end