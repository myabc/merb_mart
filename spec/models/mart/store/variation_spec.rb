require File.join( File.dirname(__FILE__), "..", "..", "..", "spec_helper" )

describe Mart::Store::Variation do

  before(:each) do
    @variation = Mart::Store::Variation.new
  end

  describe "associations" do
    
    it "should belong to a product" do
      @variation.should be_valid
    end
    
  end
  
  it "should provide images"
  it "should provide a name"

end