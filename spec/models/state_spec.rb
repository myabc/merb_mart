require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe State do
  
  describe "associations" do
    it "should belong to a country" do
      state = State.new
      state.should respond_to(:country)
      state.should respond_to(:country=)
    end
  end
  
end