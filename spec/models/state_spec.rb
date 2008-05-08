require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe State do
  
  describe "associations" do
    it "should belong to a country" do
      state = State.new
      state.should respond_to(:country)
      state.should respond_to(:country=)
      state.should respond_to(:country_code)
    end
  end
  
  before(:each) do
    State.auto_migrate!  # clear db table
  end
  
  it "should have a composite key, made up of ISO 3166-1 alpha-2 country code
      and state abbreviation" do
    maine  = State.new(:country_code => "US", :abbr => "ME", :name => "Maine")
    alaska = State.new(:country_code => "US", :abbr => "AK", :name => "Alaska")
    bremen = State.new(:country_code => "DE", :abbr => "HB", :name => "Bremen")
    
    maine.save
    alaska.save
    bremen.save
    
    #State["US", "AK"]  ## FIXME
    alaska = State.get("US", "AK")
    alaska.should_not be_nil
    alaska.key.first.should == "US"
    alaska.key.last.should == "AK"
    alaska.name.should == "Alaska"
    
    #bremen = State["DE", "HB"]  ## FIXME
    bremen = State.get("DE", "HB")
    bremen.should_not be_nil
    bremen.key.should == ["DE", "HB"]
    bremen.name.should == "Bremen"
  end
  
end