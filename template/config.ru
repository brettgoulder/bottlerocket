require 'rubygems'
require 'sinatra'
require 'bottlerocket'

set :run, false

app = Rack::Builder.new do
  map '/admin' do
    run BottlerocketAdmin
  end
end.to_app

log = File.new("sinatra.log", "a")
STDOUT.reopen(log)
STDERR.reopen(log)

run app
