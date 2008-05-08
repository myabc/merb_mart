require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Country do

  describe "associations" do
    it "should have many (0..*) states" do
      country = Country.new
      country.should respond_to(:states)
    end
    
    it "should have many (0..*) provinces (alias for states)" do
      country = Country.new
      country.should respond_to(:provinces)
    end
  end

  before(:each) do
    @country = Country.new
    Country.auto_migrate! # clear db table
  end

  it "should be valid" do
    @country.name = "Andorra"
    @country.should be_valid
  end
  
  it "should have a name field" do
    @country.valid?
    @country.errors.on(:name).should_not be_nil
  end
  
  it "should have a unique name field" do
    country1 = Country.new(:code => "FR", :name => "France")
    country2 = Country.new(:code => "ZZ", :name => "France")
    country1.save.should be_true
    country1.name = "France"
    country2.valid?
    country2.save.should be_false
    country2.errors.on(:name).should_not be_nil 
  end
  
  it "should have a code field" do
    @country.name = "Lithuania"
    @country.code = "LT"
    @country.should be_valid
  end
  
  describe "finders" do
    
  end
  
end