require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Variation do

  before(:each) do
    @variation = Variation.new
  end

  describe "associations" do
    
    it "should belong to a product" do
      @variation.should be_valid
    end
    
  end
  
  it "should provide images"
  it "should provide a name"

end