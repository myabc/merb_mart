class Country < DataMapper::Base
  
  property :name,       :string, :length => 100, :nullable => false
  property :fedex_code, :string, :length => 50
  property :ufsi_code,  :string, :length => 3
  
  # TODO: not really a normalized way of doing things? should we keep this?
  property :number_of_orders, :integer, :default => 0, :index => true

end