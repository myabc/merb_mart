require File.dirname(__FILE__) + '/../spec_helper'

describe "MerbEMart::Main (controller)" do
  
  # Feel free to remove the specs below
  
  before :all do
    Merb::Router.prepare { |r| r.add_slice(:MerbEMart) } if standalone?
  end
  
  it "should have access to the slice module" do
    controller = dispatch_to(MerbEMart::Main, :index)
    controller.slice.should == MerbEMart
    controller.slice.should == MerbEMart::Main.slice
  end
  
  it "should have an index action" do
    controller = dispatch_to(MerbEMart::Main, :index)
    controller.status.should == 200
    controller.body.should contain('MerbEMart')
  end
  
  it "should work with the default route" do
    controller = get("/merb_e_mart/main/index")
    controller.should be_kind_of(MerbEMart::Main)
    controller.action_name.should == 'index'
  end
  
  it "should have helper methods for dealing with public paths" do
    controller = dispatch_to(MerbEMart::Main, :index)
    controller.public_path_for(:image).should == "/slices/merb_e_mart/images"
    controller.public_path_for(:javascript).should == "/slices/merb_e_mart/javascripts"
    controller.public_path_for(:stylesheet).should == "/slices/merb_e_mart/stylesheets"
  end
  
  it "should have a slice-specific _template_root" do
    MerbEMart::Main._template_root.should == MerbEMart.dir_for(:view)
    MerbEMart::Main._template_root.should == MerbEMart::Application._template_root
  end

end