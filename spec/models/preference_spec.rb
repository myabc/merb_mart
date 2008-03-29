require File.join( File.dirname(__FILE__), "..", "spec_helper" )

describe Preference do

  it "should require a name and a value" do
    @preference = Preference.new
    @preference.should_not be_valid
    @preference.name = "cc_processor"
    @preference.value = "Authorize.net"
    @preference.should be_valid
  end
  
  it "should require name to be unique" do
    Preference.clear_database_table
    
    preference1 = Preference.new(:name => 'mail_username', :value => 'james')
    preference2 = Preference.new(:name => 'mail_username', :value => 'chloe')
    preference1.should be_valid
    preference1.save.should be_true
    
    #preference2.should_not be_valid
    preference2.save.should_not be_valid
    preference2.errors.on(:name).should_not be_nil
  end
  
  it "should have an init_mail_settings method"

  it "should have a save_settings method"
  
  it "should have an is_true? method"

end