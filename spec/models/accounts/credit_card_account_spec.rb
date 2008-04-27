require File.join( File.dirname(__FILE__), "..", "..", "spec_helper" )

describe Accounts::CreditCardAccount do

  it "should have a CC number if the account type is a credit card" do
    @account = Accounts::CreditCardAccount.new
    @account.order_account_type = 1 #OrderAccount.TYPES.CreditCard
    @account.should_not be_valid
  end

  it "should have a valid credit card CCV"
  it "should have a numeric expiration month"
  it "should have a numeric expiration year"
  it "should have a valid expiration month"

end