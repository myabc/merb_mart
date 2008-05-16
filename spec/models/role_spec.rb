require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Role do

  describe "associations" do
    it "should have and belong to many users" do
      role = Role.new
      pending
      #role.should respond_to(:users)
      #role.should respond_to(:users=)
    end

    it "should have and belong to many rights" do
      role = Role.new
      #role.should respond_to(:rights)
      #role.should respond_to(:rights=)
    end
  end

  it "should allow rights to be set by a list of right ids" do
    pending
  end

end
