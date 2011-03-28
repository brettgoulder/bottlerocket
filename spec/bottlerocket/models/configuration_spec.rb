require 'spec_helper'

describe Configuration do
  # it "should not be able to be instanciated" do
  #   lambda { Configuration.new }.should raise_error
  # end
  
  it "should have a database name" do
    Configuration.instance.development.database_name.should == "test"
  end
  
  it "should return a set of content types" do
    Configuration.instance.content_types.should_not be_empty
  end
  
  it "should have a hash of users" do
    Configuration.instance.users['admin'].should == "admin"
    Configuration.instance.users['client'].should == "client"
  end
end