require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe User do
  before(:each) do
    DataMapper.auto_migrate!
  end

  it "should require a username" do
    user = User.create(User.gen_attrs.except(:username))
    user.should_not be_valid
    user.errors.should include(:username)
  end
end