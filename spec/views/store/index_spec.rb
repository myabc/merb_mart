require File.join(File.dirname(__FILE__), "..", "..", 'spec_helper.rb')

describe "controller/index" do

  before( :each ) do
    @store = Store.new(fake_request)
    #@controller.instance_variable_set(:@posts, [Post.new(:id => 1, :body => "Merb!")])
    @body = @store.render(:index)
  end

  it "should have something" do
    #@body.should have_tag(:div, :class => :posts).with_tag(:div, :class => :post)
  end

  it "should wrap the body paragraph in a div with class 'post' and the post's id" do
    #@body.should have_tag(:div, :class => :post, :id => @post.id).with_tag(:p, :class => :body)
  end

  it "should render the body body within a post div" do
    #@body.should have_tag(:div,:id => @post.id).with_tag(:p) {|p| p.should contain(@post.body)}
  end
end
