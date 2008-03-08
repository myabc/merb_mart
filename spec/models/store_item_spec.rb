require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe StoreItem do

  describe "associations" do
    it "should have many order line items"
    it "should have many wishlist items"
  end
  
  it "should require a name"
  it "should require a code"
  
  it "should have a unique code"

  it "should provide a suggestion_name"

end