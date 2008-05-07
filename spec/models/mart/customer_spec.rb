require File.join( File.dirname(__FILE__), "..", "..", "spec_helper" )

describe Mart::Customer do

  describe "associations" do

    before(:each) do
      @customer = Mart::Customer.new
    end
    
    it "should have many (0..*) orders" do
      @customer.should respond_to(:orders)
    end
    
    it "should have many (0..*) addresses" do
      @customer.should respond_to(:addresses)
    end
    
    it "should have many (0..*) accounts" do
      @customer.should respond_to(:accounts)
    end
    
    it "should have many (0..*) wishlist items" do
      @customer.should respond_to(:wishlist_items)
    end
    
    it "should have items" # ??
  
  end

  describe "email address" do

    it "should require an email address" do
      customer = Mart::Customer.new
      customer.valid?
      customer.errors.on(:email_address).should_not be_nil
    end
  
    it "should require an email address to be less than least 255"
    it "should require an email address to be unique"
    it "should require a valid email address"
  
  end
  
  it "should have an authenticate method"
  
  #it "should generate a random password" do
  #  password = Customer.generate_password
  #  password.should_not be_nil
  #  password.length.should == 8
  #end
  
  #it "should generate a random password of 15 characters" do
  #  password = Customer.generate_password(15)
  #  password.should_not be_nil
  #  password.length.should == 15
  #end
  
  it "should provide the last billing address"
  it "should provide the last shipping address"
  it "should provide the last order account"

  
  #it "should have a reset_password method"
  #it "should have an add_item_to_wishlist method"
  #it "should have a remove_item_from_wishlist method"

  describe "finders" do
        it "should have one last order"
  end

end