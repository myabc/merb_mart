require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe OrderAddress do

  describe "associations" do
    it "should belong to a country"
    it "should have one order"
    it "should belong to a customer (OrderUser)"
  end
  
  it "should require a customer"
  it "should require a zip"
  it "should require a telephone"
  it "should require a first name"
  it "should require a last name"
  it "should require an address"
  
  it "should limit the first name to be a maximum of 50 characters"
  it "should limit the last name to be a maximum of 50 characters"
  it "should limit the address to a maximum of 255 characters"
  it "should not allow PO Box or variants to be entered as an address"

  it "should find a shipping address for a customer (OrderUser)"
  
  it "should provide a name"

end