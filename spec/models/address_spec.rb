require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Address do

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
    address = Address.new
    [3,50].each do |num|
      address.first_name = "a" * num
      address.valid?
      address.errors.on(:first_name).should be_nil
    end
    
    address.first_name = "a" * 51
    address.valid?
    address.errors.on(:first_name).should_not be_nil
  end
  
  it "should limit the last name to be a maximum of 50 characters" do
    address = Address.new
    [3,50].each do |num|
      address.last_name = "z" * num
      address.valid?
      address.errors.on(:last_name).should be_nil
    end
    
    address.last_name = "z" * 51
    address.valid?
    address.errors.on(:last_name).should_not be_nil
  end
  
  it "should limit the address to a maximum of 255 characters"
  
  #it "should not allow PO Box or variants to be entered as an address"

  #it "should find a shipping address for a customer (OrderUser)" do
  #  order_address = Address.find_shipping_address_for_user(1)
  #end
  
  it "should provide a name" do
    address = Address.new
    address.first_name = "John"
    address.last_name = "Doe"
    address.name.should == "John Doe"
  end

end