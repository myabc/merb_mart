require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Customer do
  before(:each) do
    DataMapper.auto_migrate!
  end

  describe "associations" do
    it "should have n orders" do
      orders = (1..10).of {Order.gen}
      customer = Customer.create(Customer.gen_attrs.merge(:orders => orders))
      customer.orders = orders
      customer.should be_valid
    end

    it "should have n addresses" do
      addresses = (1..10).of {Address.gen}
      customer = Customer.create(Customer.gen_attrs.merge(:addresses => addresses))
      customer.addresses = addresses
      customer.should be_valid
    end

    it "should have n accounts" do
      accounts = (1..10).of {Account.gen}
      customer = Customer.create(Customer.gen_attrs.merge(:accounts => accounts))
      customer.accounts = accounts
      customer.should be_valid
    end
  end
end