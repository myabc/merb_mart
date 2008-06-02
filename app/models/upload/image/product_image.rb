class ProductImage < Image

  property :product_id, Integer  # foreign-key

  belongs_to :product

  after :resize, :generate_thumbnail

  validates_present :product

  def generate_thumbnail; end
end
