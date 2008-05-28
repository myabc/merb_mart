require File.join( File.dirname(__FILE__), "..", "..", "spec_helper" )

describe LineItem do
  before(:each) do
    DataMapper.auto_migrate!
  end

  it "should require a unit_price & quantity" do
    li = LineItem.create(LineItem.gen_attrs.except(:unit_price))
    li.should_not be_valid
    li.errors.should include(:unit_price)

    li = LineItem.create(LineItem.gen_attrs.except(:quantity))
    li.should_not be_valid
    li.errors.should include(:quantity)
  end
end