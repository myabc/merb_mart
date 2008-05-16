require File.join( File.dirname(__FILE__), "..", "..", "spec_helper" )

describe Mart::Image do

  #it "should have a filename" do
  #  @image = Mart::Image.new
  #  @image.should_not be_valid
  #end

  before(:each) do
    @image = Mart::Image.new
  end

  it "should have a size" do
    @image.should_not be_valid
    @image.width = 20
    @image.height = 40
    @image.should be_valid
  end

  it "should provide an extension" do
    @image.should be_nil
    @image.filename = "fish.jpg"
    @image.extension.should == "jpg"

    @image.filename = "document.html.erb"
    @image.extension.should == "erb"
    @image.extension.should_not == "html"
  end

  it "should provide a filename without extension" do
    @image.filename = "fish.jpg"
    @image.filename_without_ext.should == "fish"
  end

  it "should provide a relative path" do
    @image.filename = "a_dogs_life.gif"
    @image.relative_path.should == "a_dogs_life.gif"
  end

end
