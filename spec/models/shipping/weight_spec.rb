require File.join( File.dirname(__FILE__), "..", "..", "..", "spec_helper" )

describe Mart::Shipping::Weight do

  describe "associations" do
    it "should belong to a shipping type" do
      weight = Mart::Shipping::Weight.new
      weight.should respond_to(:type)
    end
  end

  it "should have a min weight"
  it "should have a max weight"
  it "should have a price"

end
