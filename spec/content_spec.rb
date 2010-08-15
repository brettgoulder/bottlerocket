require File.dirname(__FILE__) + '/spec_helper'

describe ContentTypes do
  it "should load up a content types yaml" do
    test_content_types.length.should == 2
  end
  
  it "should find a content type with a name" do
    test_content_types.pages.should_not be_nil
    test_content_types.stores.should_not be_nil
  end
end

describe ContentType do
  it "should have many fields" do
    test_content_types.pages.field_names.should_not be_empty
  end
  
  it "should have a title" do
    test_content_types.pages.title.should == "Pages"
  end
  
  it "should have a singular title" do
    test_content_types.pages.single_title.should == "Page"
  end
  
  it "should have a database connection" do
    test_content_types.pages.db.should_not be_nil
  end
  
  it "should create an entity in the database" do
    page = test_content_types.pages.create :title => "Test", :body => "Page"
    page.should_not be_nil
    page.title.should == "Test"
  end
  
  it "should find all entities" do
    test_content_types.pages.find(:title => "Test").should_not be_empty
  end
  
  it "should update an entity in the database" do
    page = test_content_types.pages.find(:title => "Test").first
    page.title = "Bananas"
    page.update
    page = test_content_types.pages.find_by_id(page._id)
    page.title.should == "Bananas"
  end
  
  it "should find by id" do
    page = test_content_types.pages.find(:title => "Test").first
    page = test_content_types.pages.find_by_id(page._id)
    page.title.should == "Test"
  end
end

describe Entity do
  it "does something" do
    
  end
end