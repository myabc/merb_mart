require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Blog do

  it "should have one record" do
    Blog.should have(1).record
  end
  
  it "should find an existing blog" do
    blog = Blog.first[person.id]
    blog.should == person
  end

end