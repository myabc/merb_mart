require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Section do

  describe "associations" do
    it "should have and beong to many content nodes"
    it "should have and belong to many blogs"
    it "should acts as a tree"
  end

  it "should require a name"
  it "should require a name to be unique"
  
  it "should return find_all"
  it "should return find_ordered_parents"
  
  it "should provide a content_count"

end