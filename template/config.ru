require 'rubygems'
require 'sinatra'
require 'bottlerocket'
require File.dirname(__FILE__) + '/site'

Configuration.instance.config_file_location = File.dirname(__FILE__) + '/bottlerocket.yaml'

set :run, false

app = Rack::Builder.new do
  map '/admin' do
    run BottlerocketAdmin
  end
  
  map '/' do
    run Site
  end
end.to_app

log = File.new("sinatra.log", "a")
STDOUT.reopen(log)
STDERR.reopen(log)

run app
