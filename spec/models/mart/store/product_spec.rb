require File.join( File.dirname(__FILE__), "..", "..", "..", "spec_helper" )

describe Mart::Store::Product do

  before(:each) do
    @product = Mart::Store::Product.new
  end

  it "should be valid" do
    @product.name = "mousemat"
    @product.code = "MSMT"
    @product.should be_valid
  end

  describe "associations" do
    it "should have many product images"
    it "should have variations"
    it "should have images"
  
    it "should have related products"
    it "should have and belong to many tags"
  end
  
  it "should have a search method"
  it "should have a find_by_tags method"
  
  it "should provide a list of tags"

  it "should provide a display price"
  it "should provide a quantity"
  it "should provide a is_published"
  it "should provide a is_on_sale"
  
  it "should allow related_product_ids to be set from a list"

end