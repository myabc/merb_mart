require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Country do

  before(:each) do
    @country = Country.new
  end

  it "should be valid" do
    @country.name = "Andorra"
    @country.should be_valid
  end
  
  it do
    #@country.should have(1).errors.on(:name)
  end
  
end