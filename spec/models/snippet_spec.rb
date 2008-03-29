require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Snippet do

  it "should provide a url" do
    @snippet = Snippet.new
    @snippet.name = "my-blog-entry"
    @snippet.title = "My Blog Entry"
    @snippet.valid?
    @snippet.url.should == "my-blog-entry"
  end

  it "should have a name"
  it "should have a title"
  it "should have content"
  it "should have a displayed on date"
  it "should have a created on date"

 # it "should have one record" do
#    Snippet.should have(1).record
 # end
  
#  it "should find an existing blog" do
#    blog = Snippet.first[person.id]
#    blog.should == person
#  end

end