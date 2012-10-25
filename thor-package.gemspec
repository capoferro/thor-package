# -*- encoding: utf-8 -*-
require File.expand_path('../lib/thor-package/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Josiah Kiehl"]
  gem.email         = ["josiah@skirmisher.net"]
  gem.description   = %q{Thor tasks to package a project}
  gem.summary       = %q{Set of tasks to assist in making packages from a git controlled project.}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "thor-package"
  gem.require_paths = ["lib"]
  gem.version       = ThorPackage::VERSION

  gem.add_dependency             'thor'
  gem.add_development_dependency 'thor-scmversion'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'spork'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'vcr'
  gem.add_development_dependency 'aruba'
  gem.add_development_dependency 'rspec'
end
