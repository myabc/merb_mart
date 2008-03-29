require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Tag do

  describe "associations" do
    it "should have and belong to many products"
  end

  describe "finders" do
    
    before(:each) do
      tag1 = Tag.new(:name => 'umbrellas')
      tag2 = Tag.new(:name => 'sunscreen')
      tag3 = Tag.new(:name => 'hats')
      tag4 = Tag.new(:name => 'sandals')
    end

    it "should find alpha" do
      Tag.find_alpha.should_not be_nil
    end
  
    it "should find ordered parents" do
      Tag.find_ordered_parents.should_not be_nil
    end
  
    it "should find related tags" do
      #Tag.find_related_tags(id_list)
    end
  
    it "should provide a product count" do
      tag = Tag.all
      tag.product_count.should_not be_nil
    end

  end

end