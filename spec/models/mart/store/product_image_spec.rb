require File.join( File.dirname(__FILE__), "..", "..", "..", "spec_helper" )

describe Mart::Store::ProductImage do

  describe "associations" do
    it "should belong to a product" do
      product_image = Mart::Store::ProductImage.new
      product_image.should respond_to(:product)
    end
    
    it "should belong to an image" do
      product_image = Mart::Store::ProductImage.new
      product_image.should respond_to(:image)
    end
  end

end