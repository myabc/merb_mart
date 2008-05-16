require File.join(File.dirname(__FILE__), "../..", 'spec_helper.rb')

describe Admin::Products, "index action" do
  before(:each) do
    @controller = Admin::Products.build(fake_request)
    @controller.dispatch('index')
  end
end
