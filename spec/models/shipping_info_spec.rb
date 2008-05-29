require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe ShippingInfo do
  before(:each) do
    DataMapper.auto_migrate!
  end

  describe "associations" do
    it "should have n orders" do
      orders = (1..10).of {Order.gen}
      shipping_info = ShippingInfo.create(ShippingInfo.gen_attrs.merge(:orders => orders))
      shipping_info.orders = orders
      shipping_info.should be_valid
    end
  end
end