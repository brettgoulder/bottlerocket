lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |gem|
  gem.name = "bottlerocket"
  gem.version = "0.0.8"
  gem.platform = Gem::Platform::RUBY
  gem.authors = ["Brett Goulder", "Carl Woodward"]
  gem.email = "brett.goulder@gmail.com"
  gem.homepage = "http://github.com/brettgoulder/bottlerocket"
  gem.summary = "A nifty Sinatra/Mongo based CMS"
  gem.description = "A nifty Sinatra/Mongo based CMS made by an American and an Australian guy with an afro"
  gem.has_rdoc = false
  gem.files = %w(Readme.md Rakefile) + Dir.glob("{admin,bin,lib,template}/**/*")
  gem.require_path = "lib"
  gem.executables = [ 'bottlerocket' ]
  gem.add_dependency "activesupport", "3.0"
  gem.add_dependency "sinatra", "1.2.5"
  gem.add_dependency "mongo", "1.0.8"
  gem.add_dependency "sinatra_more", "0.3.40"
  gem.add_dependency "haml", "3.0.25"
end