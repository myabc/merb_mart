require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Order do
  before(:each) do
    DataMapper.auto_migrate!
  end

  describe "associations" do
    it "should belong to a shipping_info" do
      shipping_info = ShippingInfo.gen
      weight = Weight.gen(:shipping_info => shipping_info)
      weight.shipping_info = shipping_info
      weight.should be_valid

      weight = Weight.create(Weight.gen_attrs.except(:shipping_info))
      weight.shipping_info.should be_nil
      weight.should be_valid
    end
  end

  it "should require a min_weight, max_weight, and price" do
    weight = Weight.create(Weight.gen_attrs.except(:min_weight))
    weight.should_not be_valid
    weight.errors.should include(:min_weight)

    weight = Weight.create(Weight.gen_attrs.except(:max_weight))
    weight.should_not be_valid
    weight.errors.should include(:max_weight)

    weight = Weight.create(Weight.gen_attrs.except(:price))
    weight.should_not be_valid
    weight.errors.should include(:price)
  end
end