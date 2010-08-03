require File.dirname(__FILE__) + '/spec_helper'

describe Configuration do
  it "should not be able to be instanciated" do
    lambda { Configuration.new }.should raise_error
  end
  
  it "should have a database name" do
    Configuration.instance.database_name.should == "test"
  end
end