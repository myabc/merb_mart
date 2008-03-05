require File.join(File.dirname(__FILE__), "../..", 'spec_helper.rb')

describe Admin::Tags, "index action" do
  before(:each) do
    @controller = Admin::Tags.build(fake_request)
    @controller.dispatch('index')
  end
end