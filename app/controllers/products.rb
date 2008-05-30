class MerbEMart::Products < MerbEMart::Application

  def index
    @products = Product.all

    display @products
  end
end