require 'rubygems'
require 'rspec/core/rake_task'
task :default => :spec

desc "Build Bottlerocket"
task :build do
  system "gem build bottlerocket.gemspec"
end

desc "Run specs"
task :spec do
  RSpec::Core::RakeTask.new do |t|
    t.rspec_opts = %w(-fs --color --backtrace)
  end
end