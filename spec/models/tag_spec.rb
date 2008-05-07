require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Tag do

  describe "finders" do
    
    before(:each) do
      tag1 = Tag.new(:name => 'umbrellas')
      tag2 = Tag.new(:name => 'sunscreen')
      tag3 = Tag.new(:name => 'hats')
      tag4 = Tag.new(:name => 'sandals')
      tag5 = Tag.new(:name => 'towels')
      tag6 = Tag.new(:name => 'beach')
      tag7 = Tag.new(:name => 'vacations')
      tag8 = Tag.new(:name => 'holidays')
    end

    it "should find all tags ordered by name" do
      Tag.all_ordered.should_not be_nil
    end
  
    #it "should find ordered parents" do
    #  Tag.all_parents.should_not be_nil
    #end
  
    it "should find related tags" do
      #Tag.find_related_tags(id_list)
    end
  
    #it "should provide a product count" do
    #  tag = Tag.all
    #  tag.product_count.should_not be_nil
    #end

  end

end