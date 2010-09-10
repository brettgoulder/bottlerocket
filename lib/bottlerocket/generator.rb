require 'fileutils'

class Generator
  attr_accessor :dir
  def initialize(dir)
    self.dir = dir
  end
  
  def create_directory
    FileUtils.mkdir_p dir
  end
  
  def copy_template
    FileUtils.cp_r(File.dirname(__FILE__) + '/../../template', dir)
  end
  
  def dir_setup
    FileUtils.mkdir_p [dir + "/public/css", dir + "/public/javascripts", dir + "/public/images", dir + "/views/stylesheets"]
  end
  
end