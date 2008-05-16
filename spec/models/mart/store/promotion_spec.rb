require File.join( File.dirname(__FILE__), "..", "..", "..", "spec_helper" )

describe Mart::Store::Promotion do

  describe "associations" do
    it "should belong to an item" do
      promotion = Mart::Store::Promotion.new
      promotion.should respond_to(:item)
    end

    it "should have 0..* orders" do
      promotion = Mart::Store::Promotion.new
      promotion.should respond_to(:orders)
    end
  end

  it "should require a code"
  it "should require a discount amount"
  it "should require a discount type"
  it "should require a description"
  it "should require code to be unique"
  it "should require discount amount to be numeric"

  it "should generate a code"

  it "should display any active promotions"

  it "should provide whether it is active or not"
  it "should provide a product_name setter"

end
