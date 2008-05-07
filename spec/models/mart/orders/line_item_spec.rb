require File.join( File.dirname(__FILE__), "..", "..", "..", "spec_helper" )

describe Mart::Orders::LineItem do

  describe "associations" do    
    it "should belong to a product" do
      line_item = Mart::Orders::LineItem.new
      line_item.should respond_to(:product)
      line_item.should respond_to(:product=)
    end
    
    it "should belong to an order item" do
      line_item = Mart::Orders::LineItem.new
      pending   ## FIXME: should not be both product_id + store_item_id
    end
  end

  it "should create and returns a line item when a product is passed in"

  it "should provide a total"
  it "should provide a product id"
  it "should provide a product"
  it "should provide a code"
  it "should provide a name"

end