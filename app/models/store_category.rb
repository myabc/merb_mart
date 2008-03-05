class StoreCategory < DataMapper::Base

  has_many :products
  
  property :title,       :string, :length => 100, :nullable => false
  property :slug,        :string, :length =>  30, :nullable => false
  property :description, :text,   :lazy => false
  
  #validates_length_of     :title, :within => 3..100
  #validates_presence_of   :title
  #validates_uniqueness_of :title
  
  #validates_length_of     :slug,  :within => 3..30
  #validates_presence_of   :slug
  #validates_uniqueness_of :slug

end