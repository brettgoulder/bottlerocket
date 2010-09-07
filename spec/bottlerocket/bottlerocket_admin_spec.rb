require 'spec_helper'

describe "Bottlerocket Admin" do
  include Rack::Test::Methods
  
  def app
    @app ||= BottlerocketAdmin
  end
  
  it "should respond to /" do
    get '/'
    puts last_response.body
    last_response.should be_ok
    last_response.body.should include("Pages")
  end
  describe "Listing entities" do
    before do
      Configuration.instance.content_types.pages.create :title => "This is a test page", :body => "It has a body"
    end
    
    it "should respond to /pages" do
      get '/pages'

      last_response.should be_ok
      last_response.body.should include("Pages")
      last_response.body.should include("This is a test page")
    end
  end
  
  it "should respond to /pages/new" do
    get '/pages/new'
    last_response.should be_ok
    last_response.body.should include("Pages")
    last_response.body.should include("<form")
    last_response.body.should include("<label for=\"title\">")
  end
  
  it "should respond to POST /pages" do
    post '/pages', :entity => {:title => "Rabbits are here", :body => "Body"}
    last_response.should be_redirect
    Configuration.instance.content_types.pages.find_one(:title => "Rabbits are here").should_not be_nil
  end
  
  describe "SHOW, EDIT, UPDATE and DELETE actions" do
    before(:each) do
      Configuration.instance.content_types.pages.create :title => "This is a test page", :body => "It has a body"
      @page = Configuration.instance.content_types.pages.find_one(:title => "This is a test page")
    end
    
    it "should show SHOW when you get GET /pages/1" do
      get "/pages/#{@page._id}"
      last_response.should be_ok
      last_response.body.should include("This is a test page")
    end
    
    it "should show EDIT when you GET /pages/1/edit" do
      get "/pages/#{@page._id}/edit"
      @page.attributes.is_a?(HashWithIndifferentAccess).should be_true
      last_response.should be_ok
      last_response.body.should include("Edit")
      last_response.body.should include("This is a test page")
    end
    
    it "should DESTROY when you GET /pages/1/delete" do
      id = @page._id
      get "/pages/#{@page._id}/delete"
      @page = Configuration.instance.content_types.pages.find_by_id(:_id => id)
      @page.attributes.should be_empty
    end
  end
end