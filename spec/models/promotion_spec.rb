require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Promotion do

  describe "associations" do
    it "should belong to an item"
  
    it "should have many orders"
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