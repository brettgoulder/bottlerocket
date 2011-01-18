class Site < Sinatra::Application
  get '/' do
    '<h1>Welcome to Bottlerocket</h1>'
  end
end