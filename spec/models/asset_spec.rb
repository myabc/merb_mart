require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Asset do

  it "should have a filename" do
    @asset = Asset.new
    @asset.should_not be_valid
  end

  it "should have a size" do 
    @asset = Asset.new
    @asset.should_not be_valid
    @asset.width = 20
    @asset.height = 40
    @asset.should be_valid
  end
  
  it "should provide an extension" do
    @asset = Asset.new
    @asset.filename = "fish.jpg"
    @asset.extension.should == "jpg"
    
    @asset.filename = "document.html.erb"
    @asset.extension.should == "erb"
    @asset.extension.should_not == "html"
  end

  it "should provide a filename without extension" do
    @asset = Asset.new
    @asset.filename = "fish.jpg"
    @asset.filename_without_ext.should == "fish"
  end
  
  it "should provide a relative path" do
    @asset = Asset.new
    @asset.filename = "a_dogs_life.html"
    @asset.relative_path.should == "a_dogs_life.html"
  end

end