require File.join( File.dirname(__FILE__), "..", "..", "spec_helper" )

describe Mart::Asset do
  
  it "should provide an extension" do
    @asset = Mart::Asset.new
    @asset.filename = "fish.pdf"
    @asset.extension.should == "pdf"
    
    @asset.filename = "document.html.erb"
    @asset.extension.should == "erb"
    @asset.extension.should_not == "html"
  end

  it "should provide a filename without extension" do
    @asset = Mart::Asset.new
    @asset.filename = "fish.pdf"
    @asset.filename_base.should == "fish"
  end
  
  it "should provide a relative path" do
    @asset = Mart::Asset.new
    @asset.filename = "a_dogs_life.html"
    @asset.relative_path.should == "a_dogs_life.html"
  end

end