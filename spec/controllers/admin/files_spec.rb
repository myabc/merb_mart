require File.join(File.dirname(__FILE__), "../..", 'spec_helper.rb')

describe Admin::Files, "index action" do
  before(:each) do
    @controller = Admin::Files.build(fake_request)
    @controller.dispatch('index')
  end
end