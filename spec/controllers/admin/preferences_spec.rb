require File.join(File.dirname(__FILE__), "../..", 'spec_helper.rb')

describe Admin::Preferences, "index action" do
  before(:each) do
    @controller = Admin::Preferences.build(fake_request)
    @controller.dispatch('index')
  end
end
