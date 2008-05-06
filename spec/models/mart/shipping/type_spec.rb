require File.join( File.dirname(__FILE__), "..", "..", "..", "spec_helper" )

describe Mart::Shipping::Type do

  before(:each) do
    #OrderShippingType.clear_database_table
  end

  it "should get domestic" do
    shipping_types = Mart::Shipping::Type.get_domestic
    shipping_types.should_not be_nil
    # test the result set
  end

  it "should get foreign" do
    shipping_types = Mart::Shipping::Type.get_foreign
    shipping_types.should_not be_nil
    # test the result set
  end
  
  it "should get price"
  
  it "should calculate a price for a weight" do
    shipping_type = Mart::Shipping::Type.new
    shipping_type.price = 86.23
    shipping_type.calculate_price(112.0)
    # if no weights are set, then it should return the same price
    shipping_type.calculated_price.should == 86.23
  end
  
  it "should allow weight variations to be set from a list" do
    shipping_type = Mart::Shipping::Type.new
    weights = [20.1, 56.32, 123.2, 93.12, 1022.0]
    shipping_type.weights = weights
    shipping_type.weights.should_not be_nil
    #shipping_type.weights.first.should == 21
    # what is it returning? A OrderShippingWeight class.
  end

end