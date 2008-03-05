class OrderLineItem < DataMapper::Base
  
  belongs_to :product
  #belongs_to :item
  
end