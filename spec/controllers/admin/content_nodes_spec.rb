require File.join(File.dirname(__FILE__), "../..", 'spec_helper.rb')

describe Admin::ContentNodes, "index action" do
  before(:each) do
    @controller = Admin::ContentNodes.build(fake_request)
    @controller.dispatch('index')
  end
end