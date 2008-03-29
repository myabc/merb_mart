require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Page do
  
  it "should have a name and title" do
    @page = Page.new
    @page.should_not be_valid
    @page.name = "interesting-content"
    @page.title = "Interesting Content"
    @page.should be_valid
  end
  
  it "should have content"
  it "should have a displayed on date"
  it "should have a created on date"

  it "should provide a url" do
    @page = Page.new
    @page.name = "my-page"
    @page.title = "My Page"
    @page.valid?
    @page.url.should == "my-page"
  end

end