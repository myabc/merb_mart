require File.join(File.dirname(__FILE__), "..", 'spec_helper.rb')

describe Customers, "index action" do
  before(:each) do
    @controller = Customers.build(fake_request)
    @controller.dispatch('index')
  end
end