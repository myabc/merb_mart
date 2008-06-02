class LineItem < Item
  property :unit_price, BigDecimal
  property :quantity,   Integer

  validates_present :unit_price, :quantity
end
