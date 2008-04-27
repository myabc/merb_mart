require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Section do

  describe "associations" do
    it "should have and beong to many content nodes"
    it "should have and belong to many blogs"
    it "should acts as a tree"
  end

  it "should require a name"
  it "should require a name to be unique"
  
  describe "finders" do
  
    it "should return find_alpha" do
      Section.find_alpha.should_not be_nil
    end
    
    it "should return find_ordered_parents" do
      Section.find_ordered_parents.should_not be_nil
    end

  end
  
  ## instance methods
  it "should provide a content_count" do
    section = Section.new
    ## TODO: do whatever to build a valid instance
    #content_count.should_not be_nil
  end

end