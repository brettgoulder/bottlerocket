lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'bundler'

Gem::Specification.new do |gem|
  gem.name             = "bottlerocket"
  gem.version          = "0.0.1"
  gem.platform         = Gem::Platform::RUBY
  gem.authors          = ["Brett Goulder"]
  gem.email            = "brett.goulder@gmail.com"
  gem.homepage         = "http://github.com/brettgoulder/bottlerocket"
  gem.summary          = "Local git repository hosting"
  gem.description      = "Local git repository hosting with a sexy web interface and bonjour discovery. It's like your own little adhoc, network-aware github!"
  gem.has_rdoc         = false
  gem.files            = %w(Readme.markdown Rakefile) + Dir.glob("{bin,lib,template,admin}/**/*")
  gem.require_path     = "lib"
  gem.executables      = [ 'bottlerocket' ]
  gem.add_bundler_dependencies
end
