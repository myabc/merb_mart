require File.join( File.dirname(__FILE__), "..", "..", "..", "spec_helper" )

describe Mart::Accounts::GoogleCheckoutAccount do

  it "should have an email address" do
    @account = Mart::Accounts::GoogleCheckoutAccount.new
#    @account.should_not be_valid
    pending
  end

end
