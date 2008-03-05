require File.join(File.dirname(__FILE__), "..", 'spec_helper.rb')

describe ContentNodes, "index action" do
  before(:each) do
    @controller = ContentNodes.build(fake_request)
    @controller.dispatch('index')
  end
end