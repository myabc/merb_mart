require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Account do
  before(:each) do
    DataMapper.auto_migrate!
  end

  describe "associations" do
    it "should have 0..1 order" do
      order = Order.gen
      account = Account.create(Account.gen_attrs.merge(:order => order))
      account.order.should == order
      account.should be_valid

      account = Account.create(Account.gen_attrs.except(:order))
      account.order.should be_nil
      account.should be_valid
    end

    it "should have a customer" do
      customer = Customer.gen
      account = Account.create(Account.gen_attrs.merge(:customer => customer))
      account.customer.should == customer
      account.should be_valid

      account = Account.create(Account.gen_attrs.except(:customer))
      account.order.should be_nil
      account.should_not be_valid
      account.errors.should include(:customer)
    end
  end
end