require 'spec_helper'

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
    test_content_types.pages.create :title => "Test", :body => "Page"
    page = test_content_types.pages.find(:title => "Test").first
    page = test_content_types.pages.find_by_id(page._id)
    page.title.should == "Test"
  end
  
  it "should remove an entity from the collection" do
    test_content_types.pages.create :title => "Test", :body => "Page"
    page = test_content_types.pages.find(:title => "Test").first
    page.attributes.should_not be_empty
    test_content_types.pages.remove(:_id => page._id)
    page = test_content_types.pages.find_by_id(page._id)
    page.should be_nil
  end
  
  
  
end