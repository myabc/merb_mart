require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe OrderAccount do

  describe "associations" do
    it "should have an order account type"
    it "should have an order"
    it "should belong to a customer (OrderUser)"
  end
  
  it "should have a CC number if the account type is a credit card" do
    @order_account = OrderAccount.new
    @order_account.order_account_type = 1 #OrderAccount.TYPES.CreditCard
    @order_account.should_not be_valid
  end
  
  it "should have a routing number if the account type is a checking account"
  
  it "should have an account number if the account type is a checking account"
  
  it "should have a valid credit card CCV"
  it "should have a numeric expiration month"
  it "should have a numeric expiration year"
  it "should have a valid expiration month"
  
  it "should have a list of months" do
    months = OrderAccount.months
    months.should_not == nil
    months.empty?.should == false
    months.length.should == 12
    
    months.first.should == 1
    months.at(6).should == 7
    months.last.should == 12
  end
  
  it "should have a list of the next 10 years" do
    years = OrderAccount.years
    years.should_not == nil
    years.empty?.should == false
    years.length.should == 10
    
    years.first.should == Date.today.year
    years.at(5).should == Date.today.year + 5
    years.last.should == Date.today.year + 9
  end
  
  it "should clear personal information" do
    order_account = OrderAccount.new
    order_account.cc_number = '02301033012102010102'
    
  end
  
  it "should crypt cc_number" do
    order_account = OrderAccount.new
  end
  
  it "should crypt account_number" do
    order_account = OrderAccount.new
  end
  
  it "should get_unencrypted_number" do
    order_account = OrderAccount.new
  end
  
  it "should set unencrypted number" do
    order_account = OrderAccount.new
  end

end