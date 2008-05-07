require File.join( File.dirname(__FILE__), "..", "..", "..", "spec_helper" )

describe Mart::Store::Variation do

  before(:each) do
    @variation = Mart::Store::Variation.new
  end

  describe "associations" do
    
    it "should belong to a product" do
      @variation.should respond_to(:product)
    end

    it "should have 0..* order line items" do
      @variation.should respond_to(:line_items)
    end
    
    it "should have 0..* wishlist items" do
      @variation.should respond_to(:wishlist_items)
    end
    
  end
  
  it "should provide images"
  it "should provide a name"

end