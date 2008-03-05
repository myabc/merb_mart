class Country < DataMapper::Base
  
  property :name,       :string, :length => 100, :nullable => false
  property :fedex_code, :string, :length => 50
  property :ufsi_code,  :string, :length => 3
  #SUBSTRUCT property :number_of_orders

end