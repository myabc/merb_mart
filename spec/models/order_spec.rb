require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Order do

  before(:each) do
    @order = Order.new
  end

  it "should be valid" do
    @order.order_number = 23
    @order.should be_valid
  end

  it "should belong to an order account"
  
  it "should belong to an order user"
  
  it "should belong to an order shipping type"
  
  it "should belong to an order status code"
  
  it "should belong to a promotion"

  it "should have a unique order number"

end