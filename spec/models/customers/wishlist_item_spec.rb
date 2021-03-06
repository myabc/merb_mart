require File.join( File.dirname(__FILE__), "..", "..", "..", "spec_helper" )

describe Mart::Customers::WishlistItem do

  before(:each) do
    @wishlist_item = Mart::Customers::WishlistItem.new
  end

  describe "associations" do

    it "should belong to a customer" do
      @wishlist_item.should respond_to(:customer)
    end

    it "should belong to an item" do
      @wishlist_item.should respond_to(:store_item)
    end

  end

  describe "properties" do
    it "should have a created on date"
  end

end
