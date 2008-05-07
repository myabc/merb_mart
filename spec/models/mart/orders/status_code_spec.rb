require File.join( File.dirname(__FILE__), "..", "..", "..", "spec_helper" )

describe Mart::Orders::StatusCode do

  describe "associations" do
    it "should have orders" do
      status_code = Mart::Orders::StatusCode.new
      status_code.should respond_to(:orders)
    end
  end
  
  it "should know if it the order can be edited or not, based on 
  status code" do
    osc = Mart::Orders::StatusCode.new(:id => 1)
    #osc.is_editable?.should == false
    osc2 = Mart::Orders::StatusCode.new(:id => 6)
    #osc2.is_editable?.should == true
  end

end