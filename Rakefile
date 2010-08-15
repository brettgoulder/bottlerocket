require 'rubygems'
gem 'rspec'
require 'spec/rake/spectask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "bottlerocket"
    gemspec.summary = "The fastest CMS in a bottle"
    gemspec.description = "A Sinatra/Mongo based content management system written by an American and a dude with an Afro"
    gemspec.email = "brett.goulder@gmail.com"
    gemspec.homepage = "http://github.com/brettgoulder/bottlerocket"
    gemspec.authors = ["Brett Goulder", "Carl Woodward"]
    gemspec.add_dependency 'activesupport', '>= 2.3.8'
    gemspec.add_dependency 'mongo', '>= 1.0.7'
    gemspec.add_dependency 'jeweler', '>= 1.4.0'
    gemspec.add_dependency 'sinatra', '>= 1.0'
    gemspec.add_dependency 'sinatra_more', '>= 0.3.40'
    
    gemspec.add_development_dependency 'rspec', '1.3.0'
  end
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end

task :default => :spec

desc "Run specs"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = %w(-fs --color --backtrace)
end