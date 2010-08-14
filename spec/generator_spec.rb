require File.dirname(__FILE__) + '/spec_helper'

describe Generator do
  before :each do
    @dir = "test_bottlerocket"
    FileUtils.rm_r(@dir) if File.exists?(@dir)
  end
  
  after :each do
    FileUtils.rm_r(@dir) if File.exists?(@dir)
  end
  
  it "should create the directory" do
    Generator.new(@dir).create_directory
    File.exists?(@dir).should be_true
  end
  
  it "should copy the template directory" do
    generator = Generator.new(@dir)
    generator.create_directory
    generator.copy_template
  end
end