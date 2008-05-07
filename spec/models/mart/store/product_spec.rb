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
    
    it "should have 0..n order line items" do
      @product.should respond_to(:line_items)
    end
    
    it "should have 0..n wishlist items" do
      @product.should respond_to(:wishlist_items)
    end
    
    it "should have 0..n variations" do
      @product.should respond_to(:variations)
    end

    it "should have many product images" do
      @product.should respond_to(:product_images)
    end
       
    it "should have images" do
      pending
    end
  
    it "should have related products"
    
    it "should have and belong to many tags" do
      pending
    end
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