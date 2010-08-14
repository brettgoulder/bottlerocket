require 'sinatra'

class BottlerocketAdmin < Sinatra::Application
  configure do
    set :views => File.dirname(__FILE__) + "/../../admin/views"
    set :public => File.dirname(__FILE__) + "/../../admin/public"
  end
  
  get '' do
    "It is working"
  end
end