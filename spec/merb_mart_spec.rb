require File.dirname(__FILE__) + '/spec_helper'

describe "MerbMart (module)" do
  
  it "should have proper specs"

  # To spec MerbMart you need to hook it up to the router like this:
  
  # before :all do
  #   Merb::Router.prepare { add_slice(:MerbMart) } if standalone?
  # end
  # 
  # after :all do
  #   Merb::Router.reset! if standalone?
  # end
  
  it "should be registered in Merb::Slices.slices" do
    Merb::Slices.slices.should include(MerbMart)
  end
  
  it "should have an :identifier property" do
    MerbMart.identifier.should == "merb_mart"
  end
  
  it "should have an :identifier_sym property" do
    MerbMart.identifier_sym.should == :merb_E_mart
  end
  
  it "should have a :root property" do
    MerbMart.root.should == current_slice_root
    MerbMart.root_path('app').should == current_slice_root / 'app'
  end
  
  it "should have metadata properties" do
    MerbMart.description.should == "MerbMart is a chunky Merb slice!"
    MerbMart.version.should == "0.0.1"
    MerbMart.author.should == "YOUR NAME"
  end
  
  it "should have a config property (Hash)" do
    MerbMart.config.should be_kind_of(Hash)
  end
  
  it "should have a :layout config option set" do
    MerbMart.config[:layout].should == :merb_E_mart
  end
  
  it "should have a dir_for method" do
    app_path = MerbMart.dir_for(:application)
    app_path.should == current_slice_root / 'app'
    [:view, :model, :controller, :helper, :mailer, :part].each do |type|
      MerbMart.dir_for(type).should == app_path / "#{type}s"
    end
    public_path = MerbMart.dir_for(:public)
    public_path.should == current_slice_root / 'public'
    [:stylesheet, :javascript, :image].each do |type|
      MerbMart.dir_for(type).should == public_path / "#{type}s"
    end
  end
  
  it "should have a app_dir_for method" do
    root_path = MerbMart.app_dir_for(:root)
    root_path.should == Merb.root / 'slices' / 'merb_mart'
    app_path = MerbMart.app_dir_for(:application)
    app_path.should == root_path / 'app'
    [:view, :model, :controller, :helper, :mailer, :part].each do |type|
      MerbMart.app_dir_for(type).should == app_path / "#{type}s"
    end
    public_path = MerbMart.app_dir_for(:public)
    public_path.should == Merb.dir_for(:public) / 'slices' / 'merb_mart'
    [:stylesheet, :javascript, :image].each do |type|
      MerbMart.app_dir_for(type).should == public_path / "#{type}s"
    end
  end
  
  it "should have a public_dir_for method" do
    public_path = MerbMart.public_dir_for(:public)
    public_path.should == '/slices' / 'merb_mart'
    [:stylesheet, :javascript, :image].each do |type|
      MerbMart.public_dir_for(type).should == public_path / "#{type}s"
    end
  end
  
  it "should keep a list of path component types to use when copying files" do
    (MerbMart.mirrored_components & MerbMart.slice_paths.keys).length.should == MerbMart.mirrored_components.length
  end
  
end
