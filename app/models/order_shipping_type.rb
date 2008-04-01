class OrderShippingType
  
  include DataMapper::Persistable
  
  has_many :orders
  has_many :weights, :class => 'OrderShippingWeight', :dependent => :destroy

  attr_accessor :calculated_price

  property :name,        :string, :length => 100, :default => "", :nullable => false
  property :code,        :string, :length => 50
  property :is_domestic, :boolean, :default => true, :nullable => false
  property :price,       :float,   :default => 0.0,  :nullable => false
  
  def self.get_domestic
    all(:is_domestic => true, :order => "price ASC")
  end

  def self.get_foreign
    all(:is_domestic => false, :order => "price ASC")
  end
  
  # Calculates shipping price for a shipping type with weight.
  # If no weight found, use the default.
  def calculate_price(weight)
    
    price = self.price
    
    if self.weights.size > 0
      proper_weight = self.weights.first(
        :conditions => ["? BETWEEN min_weight AND max_weight", weight]
      )
      price = proper_weight.price if proper_weight
    end
        
    #self.calculated_price = price + Preference.find_by_name('store_handling_fee').value.to_f
    self.calculated_price = price 
  end
  
  # Sets weight variations from attribute list.
  #
  def weights=(list)
    self.weights.clear
    for variation in list do
      v = OrderShippingWeight.create(variation)
      self.weights << v
    end
  end
  
end