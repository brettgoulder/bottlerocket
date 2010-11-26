require 'rubygems'
require 'spec/rake/spectask'
task :default => :spec

desc "Build Bottlerocket"
task :build do
  system "gem build bottlerocket.gemspec"
end

desc "Run specs"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = %w(-fs --color --backtrace)
end