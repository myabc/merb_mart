require File.join(File.dirname(__FILE__), "..", 'spec_helper.rb')

describe Questions, "index action" do
  before(:each) do
    @controller = Questions.build(fake_request)
    @controller.dispatch('index')
  end
end