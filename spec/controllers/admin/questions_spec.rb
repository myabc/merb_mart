require File.join(File.dirname(__FILE__), "../..", 'spec_helper.rb')

describe Admin::Questions, "index action" do
  before(:each) do
    @controller = Admin::Questions.build(fake_request)
    @controller.dispatch('index')
  end
end