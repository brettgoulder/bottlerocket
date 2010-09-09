require 'spec_helper'

describe Configuration do
  it "should not be able to be instanciated" do
    lambda { Configuration.new }.should raise_error
  end
  
  it "should have a database name" do
    Configuration.instance.database_name.should == "test"
  end
  
  it "should return a set of content types" do
    Configuration.instance.content_types.should_not be_empty
  end
end