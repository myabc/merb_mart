require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe OrderShippingType do

  before(:each) do
    #OrderShippingType.clear_database_table
  end

  it "should get domestic" do
    @shipping_types = OrderShippingType.get_domestic
  end

  it "should get foreign" do
    @shipping_types = OrderShippingType.get_foreign
  end
  
  it "should get price"
  
  it "should calculate a price for a weight"
  it "should allow weight variations to be set from a list"

end