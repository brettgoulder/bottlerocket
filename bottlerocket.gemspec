# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{bottlerocket}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brett Goulder", "Carl Woodward"]
  s.date = %q{2010-08-14}
  s.default_executable = %q{bottlerocket}
  s.description = %q{A Sinatra/Mongo based content management system written by an American and a dude with an Afro}
  s.email = %q{brett.goulder@gmail.com}
  s.executables = ["bottlerocket"]
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    ".bundle/config",
     ".gitignore",
     "Gemfile",
     "README.markdown",
     "Rakefile",
     "VERSION",
     "bin/bottlerocket",
     "bottlerocket.gemspec",
     "lib/generator.rb",
     "lib/has_connection.rb",
     "lib/models/configuration.rb",
     "lib/models/content_type.rb",
     "lib/models/content_types.rb",
     "lib/models/entity.rb",
     "lib/simple_struct.rb",
     "spec/config_test.yaml",
     "spec/configuration_spec.rb",
     "spec/content_spec.rb",
     "spec/content_type_test.yaml",
     "spec/generator_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "template/README.markdown"
  ]
  s.homepage = %q{http://github.com/brettgoulder/bottlerocket}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{The fastest CMS in a bottle}
  s.test_files = [
    "spec/configuration_spec.rb",
     "spec/content_spec.rb",
     "spec/generator_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 2.3.8"])
      s.add_runtime_dependency(%q<mongo>, [">= 1.0.7"])
      s.add_runtime_dependency(%q<jeweler>, [">= 1.4.0"])
      s.add_development_dependency(%q<rspec>, ["= 1.3.0"])
    else
      s.add_dependency(%q<activesupport>, [">= 2.3.8"])
      s.add_dependency(%q<mongo>, [">= 1.0.7"])
      s.add_dependency(%q<jeweler>, [">= 1.4.0"])
      s.add_dependency(%q<rspec>, ["= 1.3.0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 2.3.8"])
    s.add_dependency(%q<mongo>, [">= 1.0.7"])
    s.add_dependency(%q<jeweler>, [">= 1.4.0"])
    s.add_dependency(%q<rspec>, ["= 1.3.0"])
  end
end

