require File.join( File.dirname(__FILE__), "..", "..", "spec_helper" )

describe Image do
  before(:each) do
    DataMapper.auto_migrate!
  end

  it "should require a width & height" do
    image = Image.create(Image.gen_attrs.except(:width))
    image.should_not be_valid
    image.errors.should include(:width)

    image = Image.create(Image.gen_attrs.except(:height))
    image.should_not be_valid
    image.errors.should include(:height)
  end
end