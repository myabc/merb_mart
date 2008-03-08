require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe OrderUser do

  describe "associations" do

    it "should have orders"
    it "should have one last order"
    it "should have many addresses"
    it "should have many accounts"
  
    it "should have wishlist items"
    it "should have items" # ??
  
  end

  describe "email address" do

    it "should require an email address" do
      order_user = OrderUser.new
      order_user.valid?
      order_user.errors.on(:email).should_not be_nil
    end
  
    it "should require an email address to be less than least 255"
    it "should require an email address to be unique"
    it "should require a valid email address"
  
  end
  
  it "should have an authenticate method"
  
  it "should generate a random password" do
    password = OrderUser.generate_password
    password.should_not be_nil
    password.length.should == 8
  end
  
  it "should generate a random password of 15 characters" do
    password = OrderUser.generate_password(15)
    password.should_not be_nil
    password.length.should == 15
  end
  
  it "should provide the last billing address"
  it "should provide the last shipping address"
  it "should provide the last order account"
  
  it "should have a reset_password method"
  it "should have an add_item_to_wishlist method"
  it "should have a remove_item_from_wishlist method"

end