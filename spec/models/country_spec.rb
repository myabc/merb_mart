require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Country do

  before(:each) do
    @country = Country.new
  end

  it "should be valid" do
    @country.name = "Andorra"
    @country.should be_valid
  end
  
  it "should have a name field" do
    @country.valid?
    @country.errors.on(:name).should_not be_nil
  end
  
  it "should have a FedEx field" do
    @country.name = "Lithuania"
    @country.fedex_code = "LT"
    @country.should be_valid
  end
  
  it "should have a ufsi code" do
    @country.name = "Nigeria"
    @country.ufsi_code = "136"
    @country.should be_valid
  end
  
  describe "finders" do
    
  end
  
end