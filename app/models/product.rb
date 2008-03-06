class Product < StoreItem
  
  belongs_to :store_category
  has_many   :variations
  
  #property :title,       :string, :length => 100, :nullable => false
  #property :slug,        :string, :length =>  30, :nullable => false
  #property :description, :text
  
  #has_many :varieties
  #has_many :sizes
  
end