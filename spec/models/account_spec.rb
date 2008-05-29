require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Account do
  before(:each) do
    DataMapper.auto_migrate!
  end

  describe "associations" do
    it "should has 1..n transactions" do
      transactions = (1..10).of {Transaction.gen}
      account = Account.create(Account.gen_attrs.merge(:transactions => transactions))
      account.transactions.should == transactions
      account.should be_valid
    end

    it "should belong to an address" do
      address = Address.gen
      account = Account.create(Account.gen_attrs.merge(:address => address))
      account.address.should == address

      account = Account.create(Account.gen_attrs.except(:address))
      account.address.should be_nil
      account.should_not be_valid
      account.errors.should include(:address)
    end
  end
end