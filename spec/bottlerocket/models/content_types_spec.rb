require 'spec_helper'

describe ContentTypes do
  it "should load up a content types yaml" do
    test_content_types.length.should == 2
  end
  
  it "should find a content type with a name" do
    test_content_types.pages.should_not be_nil
    test_content_types.stores.should_not be_nil
  end
  
end