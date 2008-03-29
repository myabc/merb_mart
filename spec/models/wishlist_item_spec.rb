require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe WishlistItem do

  before(:each) do
    @wishlist_item = WishlistItem.new
  end

  describe "associations" do
    
    it "should belong to an order user" do
      @wishlist_item.should be_valid
    end
    
    it "should belong to an item" do
      @wishlist_item.should be_valid
    end
    
  end
  
  describe "properties" do
    it "should have a created on date"
  end

end