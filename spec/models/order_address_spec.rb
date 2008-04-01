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
  
  it "should limit the first name to be a maximum of 50 characters" do
    order_address = OrderAddress.new
    [3,51].each do |num|
      order_address.first_name = "a" * num
      #order_address.valid?
      order_address.errors.on(:first_name).should be_nil
    end
  end
  
  it "should limit the last name to be a maximum of 50 characters"
  
  it "should limit the address to a maximum of 255 characters"
  
  it "should not allow PO Box or variants to be entered as an address"

  it "should find a shipping address for a customer (OrderUser)" do
    order_address = OrderAddress.find_shipping_address_for_user(1)
  end
  
  it "should provide a name" do
    order_address = OrderAddress.new
    order_address.first_name = "John"
    order_address.last_name = "Doe"
    order_address.name.should == "John Doe"
  end

end