require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Transaction do
  before(:each) do
    DataMapper.auto_migrate!
  end

  describe "associations" do
    it "should belong to an order" do
      order = Order.gen
      transaction = Transaction.gen(:order => order)
      transaction.order.should == order
      transaction.should be_valid

      transaction = Transaction.create(Transaction.gen_attrs.except(:order))
      transaction.order.should be_nil
      transaction.should_not be_valid
      transaction.errors.should include(:order)
    end

    it "should belong to an account" do
      account = Account.gen
      transaction = Transaction.gen(:account => account)
      transaction.account.should == account
      transaction.should be_valid

      transaction = Transaction.create(Transaction.gen_attrs.except(:account))
      transaction.account.should be_nil
      transaction.should_not be_valid
      transaction.errors.should include(:account)
    end
  end
end