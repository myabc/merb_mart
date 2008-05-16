require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Right do

  describe "associations" do
    it "should have and belong to many roles" do
      right = Right.new
      right.should respond_to(:roles)
      #right.should respond_to(:roles=)
    end
  end

end
