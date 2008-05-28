class LineItem < Item

  property :unit_price, BigDecimal,  :default => 0.0, :nullable => false
  property :quantity,   Integer,     :default => 0,   :nullable => false
end