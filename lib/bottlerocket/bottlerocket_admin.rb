require 'sinatra'
require 'sinatra_more/markup_plugin'

class BottlerocketAdmin < Sinatra::Application
  register SinatraMore::MarkupPlugin
  
  configure do
    set :views => File.dirname(__FILE__) + "/../../admin/views"
    set :public => File.dirname(__FILE__) + "/../../admin/public"
    enable :static
    set :haml, {:format => :html5}
  end
  
  helpers do
    def admin_path(location)
      "/admin/#{location}"
    end
  end
  
  use Rack::Auth::Basic do |username, password|
    [username, password] == ['admin', 'admin']
  end
  
  get "/stylesheets/:file.css" do |file|
    content_type 'text/css'
    sass(:"stylesheets/#{file}", :load_paths => ([ File.join(File.dirname(__FILE__), 'views', 'stylesheets') ]))
  end
  
  get '/' do
    @content_types = Configuration.instance.content_types.all
    haml :index
  end
  
  get '/:handle' do |handle|
    @content_type = Configuration.instance.content_types.find(handle)
    haml :entities
  end
  
  get '/:handle/new' do |handle|
    @content_type = Configuration.instance.content_types.find(handle)
    @entity = SimpleStruct.new
    haml :entity, :locals => {:form_name => "New Form"}
  end
  
  get '/:handle/:id/edit' do |handle, id|
    @content_type = Configuration.instance.content_types.find(handle)
    @entity = Configuration.instance.content_types.find(handle).find_by_id(id)
    haml :entity, :locals => {:form_name => "Edit Form"}
  end
  
  get '/:handle/:id/delete' do |handle, id|
    Configuration.instance.content_types.find(handle).remove(:_id => id)
    redirect admin_path(handle)
  end
  
  get '/:handle/:id' do |handle, id|
    @entity = Configuration.instance.content_types.find(handle).find_by_id(id)
    haml :show
  end
    
  post '/:handle' do |handle|
    Configuration.instance.content_types.find(handle).create params[:entity]
    redirect admin_path(handle)
  end
end