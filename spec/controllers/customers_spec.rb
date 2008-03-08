require File.join(File.dirname(__FILE__), "..", 'spec_helper.rb')

describe Customers, "index action" do
  before(:each) do
    dispatch_to(Customers, :index)
  end
end