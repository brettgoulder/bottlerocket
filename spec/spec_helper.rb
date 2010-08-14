require 'rubygems'
require 'spec'
require 'rack/test'
require File.dirname(__FILE__) + '/../lib/bottlerocket'

Configuration.instance.config_file_location = File.dirname(__FILE__) + '/config_test.yaml'

def test_content_types
  ContentTypes.load(File.dirname(__FILE__) + '/content_type_test.yaml')
end