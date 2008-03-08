require File.join(File.dirname(__FILE__), "..", 'spec_helper.rb')

describe ContentNodes, "index action" do
  before(:each) do
    dispatch_to(ContentNodes, :index)
  end
end