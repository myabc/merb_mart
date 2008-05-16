require File.join(File.dirname(__FILE__), "../..", 'spec_helper.rb')

describe Admin::Orders, "index action" do
  before(:each) do
    @controller = Admin::Orders.build(fake_request)
    @controller.dispatch('index')
  end
end
