require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Order do
  before(:each) do
    DataMapper.auto_migrate!
  end

  describe "associations" do
    it "should belong to a customer" do
      customer = Customer.gen
      order = Order.create(Order.gen_attrs.merge(:customer => customer))
      order.customer.should == customer
      order.should be_valid

      order = Order.create(Order.gen_attrs.except(:customer))
      order.customer.should be_nil
      order.should_not be_valid
      order.errors.should include(:customer)
    end

    it "should have 1..n line_items" do
      line_items = (1..10).of {LineItem.gen}
      order = Order.create(Order.gen_attrs.merge(:line_items => line_items))
      order.line_items.should == line_items
      order.should be_valid

      order = Order.create(Order.gen_attrs.except(:line_items))
      order.line_items.should be_empty
      order.should_not be_valid
      order.errors.should include(:line_items)
    end

    it "should have 1..n transactions" do
      transactions = (1..10).of {Transaction.gen}
      order = Order.create(Order.gen_attrs.merge(:transactions => transactions))
      order.transactions.should == transactions
      order.should be_valid

      order = Order.create(Order.gen_attrs.except(:transactions))
      order.transactions.should be_empty
      order.should be_valid
    end

    it "should have 1 shipping info" do
      shipping_info = ShippingInfo.gen
      order = Order.create(Order.gen_attrs.merge(:shipping_info => shipping_info))
      order.shipping_info.should == shipping_info
      order.should be_valid

      order = Order.create(Order.gen_attrs.except(:shipping_info))
      order.shipping_info.should be_nil
      order.should_not be_valid
      order.errors.should include(:shipping_info)
    end

    it "should have 0..1 promotion" do
      pending "many to many in DM core"

      promotion = Promotion.gen
      order = Order.create(Order.gen_attrs.merge(:promotion => promotion))
      order.promotion.should == promotion
      order.should be_valid

      order = Order.create(Order.gen_attrs.except(:promotion))
      order.promotion.should be_nil
      order.should be_valid
    end
  end
end
