class MerbMart::Products < MerbMart::Application

  def index
    @products = Product.all

    display @products
  end
end
