# Holds information about how the product varies.
#
class Variation < StoreItem
  
  belongs_to :product
  
  property :variation_quantity,  :integer, :default => 0, :nullable => false
  
  #############################################################################
  # CALLBACKS
  #############################################################################
  
  before_save :set_date_available
  after_save  :update_parent_quantity
  
  # DB complains if there's not a date available set.
  # This is a cheap fix.
  def set_date_available
    self.date_available = Date.today if !self.date_available
  end
  
  def update_parent_quantity
    self.product.update_attribute('variation_quantity', self.product.variations.sum('quantity'))
  end
  
  #############################################################################
  # CLASS METHODS
  #############################################################################
  
  # References parent product images collection.
  #
  def images
    self.product.images
  end

  # Display name...includes product name as well
  def name
    if self.product
      return "#{self.product.name} - #{self.attributes['name']}"
    else
      return self.attributes['name']
    end
  end
  def short_name
    self.attributes['name']
  end
  # Override setter?
  # def name=(str)
  #   self.attributes['name'] = str
  # end

end