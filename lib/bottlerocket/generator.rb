require 'fileutils'

class Generator
  attr_accessor :dir
  def initialize(dir)
    self.dir = dir
  end
  
  def create_directory
    FileUtils.mkdir dir
  end
  
  def copy_template
    FileUtils.cp_r(File.dirname(__FILE__) + '/../../template', dir)
  end
end