require File.join(File.dirname(__FILE__), "../..", 'spec_helper.rb')

describe Admin::Sections, "index action" do
  before(:each) do
    @controller = Admin::Sections.build(fake_request)
    @controller.dispatch('index')
  end
end