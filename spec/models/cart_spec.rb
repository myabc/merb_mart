require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Cart do

  it "should be empty on initialize" do
    @cart = Cart.new
    @cart.items.should be_empty
  end

end

describe Cart, "tax calculation" do

  it "should have zero tax on initialize" do
    @cart = Cart.new
    @cart.tax.should == 0.0
  end
  
  it "should return a valid tax_cost" do
    @cart = Cart.new
    # need to use a mock for this
    #@cart.tax = 0.175
    #@cart.total = 102.12
    #@cart.tax_cost.should == 17.871
  end

end

describe Cart, "total calculation" do
  
  it "should have a zero total on initialize" do
    @cart = Cart.new
    @cart.total.should == 0.0
  end
  
end

describe Cart, "shipping_cost calculation" do
  
  it "should have a zero shipping_cost on initialize" do
    @cart = Cart.new
    @cart.shipping_cost.should == 0.0
  end
  
end