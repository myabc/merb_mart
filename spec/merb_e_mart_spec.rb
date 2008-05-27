require File.dirname(__FILE__) + '/spec_helper'

describe "MerbEMart (module)" do
  
  it "should have proper specs"
  
  # Feel free to remove the specs below
  
  it "should be registered in Merb::Slices.slices" do
    Merb::Slices.slices.should include(MerbEMart)
  end
  
  it "should have an :identifier property" do
    MerbEMart.identifier.should == "merb_e_mart"
  end
  
  it "should have an :identifier_sym property" do
    MerbEMart.identifier_sym.should == :merb_e_mart
  end
  
  it "should have a :root property" do
    MerbEMart.root.should == current_slice_root
    MerbEMart.root_path('app').should == current_slice_root / 'app'
  end
  
  it "should have metadata properties" do
    MerbEMart.description.should == "MerbEMart is a chunky Merb slice!"
    MerbEMart.version.should == "0.0.1"
    MerbEMart.author.should == "YOUR NAME"
  end
  
  it "should have a config property (Hash)" do
    MerbEMart.config.should be_kind_of(Hash)
  end
  
  it "should have a :layout config option set" do
    MerbEMart.config[:layout].should == :merb_e_mart
  end
  
  it "should have a dir_for method" do
    app_path = MerbEMart.dir_for(:application)
    app_path.should == current_slice_root / 'app'
    [:view, :model, :controller, :helper, :mailer, :part].each do |type|
      MerbEMart.dir_for(type).should == app_path / "#{type}s"
    end
    public_path = MerbEMart.dir_for(:public)
    public_path.should == current_slice_root / 'public'
    [:stylesheet, :javascript, :image].each do |type|
      MerbEMart.dir_for(type).should == public_path / "#{type}s"
    end
  end
  
  it "should have a app_dir_for method" do
    root_path = MerbEMart.app_dir_for(:root)
    root_path.should == Merb.root / 'slices' / 'merb_e_mart'
    app_path = MerbEMart.app_dir_for(:application)
    app_path.should == root_path / 'app'
    [:view, :model, :controller, :helper, :mailer, :part].each do |type|
      MerbEMart.app_dir_for(type).should == app_path / "#{type}s"
    end
    public_path = MerbEMart.app_dir_for(:public)
    public_path.should == Merb.dir_for(:public) / 'slices' / 'merb_e_mart'
    [:stylesheet, :javascript, :image].each do |type|
      MerbEMart.app_dir_for(type).should == public_path / "#{type}s"
    end
  end
  
  it "should have a public_dir_for method" do
    public_path = MerbEMart.public_dir_for(:public)
    public_path.should == '/slices' / 'merb_e_mart'
    [:stylesheet, :javascript, :image].each do |type|
      MerbEMart.public_dir_for(type).should == public_path / "#{type}s"
    end
  end
  
  it "should keep a list of path component types to use when copying files" do
    (MerbEMart.mirrored_components & MerbEMart.slice_paths.keys).length.should == MerbEMart.mirrored_components.length
  end
  
end