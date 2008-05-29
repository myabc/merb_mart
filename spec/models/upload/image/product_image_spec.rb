require File.join( File.dirname(__FILE__), "..", "..", "..", "spec_helper" )

describe ProductImage do
  before(:each) do
    DataMapper.auto_migrate!
  end

  describe "associatons" do
    it "should belong to a product" do
      product = Product.gen
      product_image = ProductImage.create(ProductImage.gen_attrs.merge(:product => product))
      product_image.product.should == product
      product_image.should be_valid

      product_image = ProductImage.create(ProductImage.gen_attrs.except(:product))
      product_image.product.should be_nil
      product_image.should_not be_valid
      product_image.errors.should include(:product)
    end
  end
end