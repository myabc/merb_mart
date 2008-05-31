require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Upload do
  before(:each) do
    DataMapper.auto_migrate!
  end

  it "should require a location" do
    upload = Upload.create(Upload.gen_attrs.except(:location))
    upload.should_not be_valid
    upload.errors.should include(:location)
  end
end