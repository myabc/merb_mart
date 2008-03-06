require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Product do

  before(:each) do
    @product = Product.new
  end

  it "should be valid" do
    @product.title = "mousemat"
    @product.slug = "mousemat"
    @product.should be_valid
  end

end