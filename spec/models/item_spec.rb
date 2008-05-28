require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Item do
  before(:each) do
    DataMapper.auto_migrate!
  end

  describe "associations" do
    it "should belong to a product" do
      product = Product.gen
      item = Item.create(Item.gen_attrs.merge(:product => product))
      item.product.should == product
      item.should be_valid
    end
  end
end