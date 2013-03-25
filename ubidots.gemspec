# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ubidots/version'

Gem::Specification.new do |gem|
  gem.name          = "ubidots"
  gem.version       = Ubidots::VERSION
  gem.authors       = ["Federico Builes"]
  gem.email         = ["federico.builes@gmail.com"]
  gem.description   = "Ruby library to access the Ubidots API"
  gem.summary       = "Ruby library to access the Ubidots API"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency("rest-client")
  gem.add_dependency("json")
  gem.add_development_dependency("rspec")
end
