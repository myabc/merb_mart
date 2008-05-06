require File.join( File.dirname(__FILE__), "..", "..", "..", "spec_helper" )

describe Mart::Store::ProductImage do

  describe "associations" do
    it "should belong to a product"
    it "should belong to an image"
  end

end