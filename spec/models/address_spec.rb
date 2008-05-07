require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Address do

  describe "associations" do
    it "should belong to a country" do
      address = Address.new
      address.should respond_to(:country)
      address.should respond_to(:country=)
    end
    
    it "should belong to a state" do
      address = Address.new
      address.should respond_to(:state)
      address.should respond_to(:state=)
    end
    
    it "should belong to a province (alias for state)" do
      #state = mock("state")
      address = Address.new
      address.should respond_to(:province)
      address.should respond_to(:province=)
      #address.province = state
    end
  end
  
  it "should require a zip, telephone, last name, first name and address" do
    address = Address.new
    address.valid?
    address.errors.on(:first_name).should_not be_nil
    address.errors.on(:last_name).should_not be_nil
    address.errors.on(:address1).should_not be_nil
    address.errors.on(:postal_code).should_not be_nil
    address.first_name = "John"
    address.last_name = "Doe"
    address.address1 = "1012 E 87th St"
    address.postal_code = "10021"
    address.should be_valid
  end
  
  it "should provide the zipcode alias for postal code" do
    address1 = Address.new
    address1.postal_code = "91210"
    address1.zipcode.should == "91210"
    address2 = Address.new
    address2.zipcode = "10004"
    address2.postal_code.should == "10004"
  end
  
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
  
  it "should provide a name" do
    address = Address.new
    address.first_name = "John"
    address.last_name = "Doe"
    address.name.should == "John Doe"
  end

end