class ProductImage < Image
  include Merb::Slices::config[:merb_E_mart][:thumbnail_mixin]

  property :product_id, Integer  # foreign-key

  belongs_to :product

  after :resize, :generate_thumbnail

  validates_present :product
end