require File.join(File.dirname(__FILE__), "../..", 'spec_helper.rb')

describe Admin::Promotions, "index action" do
  before(:each) do
    @controller = Admin::Promotions.build(fake_request)
    @controller.dispatch('index')
  end
end