require 'rubygems'
gem 'rspec'
require 'spec/rake/spectask'


task :default => :spec

require 'bundler'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "bottlerocket"
    gemspec.summary = "A nifty Sinatra/Mongo based CMS system"
    gemspec.description = "A nifty Sinatra/Mongo based CMS system created by one American and an Aussie with an afro"
    gemspec.email = "brett.goulder@gmail.com"
    gemspec.homepage = "http://github.com/technicalpickles/the-perfect-gem"
    gemspec.authors = ["Brett Goulder", "Carl Woodward"]
    gemspec.executables      = [ 'bottlerocket' ]
    gemspec.add_bundler_dependencies
  end
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end


desc "Run specs"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = %w(-fs --color --backtrace)
end