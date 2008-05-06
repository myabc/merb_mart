require File.join( File.dirname(__FILE__), "..", "..", "..", "spec_helper" )

describe Mart::Accounts::PaypalAccount do

  it "should have an email address" do
    @account = Mart::Accounts::PaypalAccount.new
#    @account.should_not be_valid
    pending
  end

end