require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Blog do

  it "should provide a url" do
    @blog = Blog.new
    @blog.name = "my-blog-entry"
    @blog.title = "My Blog Entry"
    @blog.valid?
    @blog.url.should == "my-blog-entry"
  end

  it "should have a name"
  it "should have a title"
  it "should have content"
  it "should have a displayed on date"
  it "should have a created on date"

  it "should have one record" do
    Blog.should have(1).record
  end
  
  it "should find an existing blog" do
    blog = Blog.first[person.id]
    blog.should == person
  end
  
  it "should find latest" do
    Blog.find_latest
    
  end

end