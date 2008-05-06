require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe OrderStatusCode do

  describe "associations" do
    it "should have orders"
  end
  
  it "should know if it the order can be edited or not, based on 
  status code" do
    osc = OrderStatusCode.new(id => 1)
    #osc.is_editable?.should == false
    osc2 = OrderStatusCode.new(id => 6)
    #osc2.is_editable?.should == true
  end

end