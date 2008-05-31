require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Country do

  before(:each) do
    DataMapper.auto_migrate!
    @country = Country.gen
  end

  describe "associations" do
    it "should have many (0..*) states" do
      @country.should respond_to(:states)
      @country.states.each do |state|
        state.country.should == @country
      end
    end

    it "should have many (0..*) provinces (alias for states)" do
      @country.should respond_to(:provinces)
    end
  end

  it "should be valid when all attributes are supplied" do
    Country.gen.should be_valid
  end

  it "should have a name field" do
    Country.create(Country.gen_attrs.except(:name)).should_not be_valid
  end

  it "should have a unique name field" do
    Country.create(Country.gen_attrs.merge(:name => @country.name)).should_not be_valid

end
