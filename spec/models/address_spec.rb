require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Address do
  before(:each) do
    DataMapper.auto_migrate!
  end

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

  it "should require a postal_code, last name, first name and address" do
    Address.create(Address.gen_attrs.except(:postal_code)).should_not be_valid
    Address.create(Address.gen_attrs.except(:last_name)).should_not be_valid
    Address.create(Address.gen_attrs.except(:first_name)).should_not be_valid
    Address.create(Address.gen_attrs.except(:address1)).should_not be_valid
  end

  it "should provide the zipcode alias for postal code" do
    address = Address.gen
    address.zipcode.should == address.postal_code
  end

  it "should limit the first name to be a maximum of 50 characters" do
    [3,50].each do |num|
      Address.gen(:first_name => "a" * num).should be_valid
    end

    Address.gen(:first_name => "a" * 51).should_not be_valid
  end

  it "should limit the last name to be a maximum of 50 characters" do
    [3,50].each do |num|
      Address.gen(:last_name => "a" * num).should be_valid
    end

    Address.gen(:last_name => "a" * 51).should_not be_valid
  end

  it "should limit the address to a maximum of 200 characters" do
    [3,200].each do |num|
      Address.gen(:address1 => "a" * num).should be_valid
    end

    Address.gen(:address1 => "a" * 201).should_not be_valid
  end

  #it "should not allow PO Box or variants to be entered as an address"

  it "should provide a name" do
    Address.gen(:first_name => 'John', :last_name => 'Doe').name.should == 'John Doe'
  end
end