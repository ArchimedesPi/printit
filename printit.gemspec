# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'printit/version'

Gem::Specification.new do |spec|
  spec.name          = "printit"
  spec.version       = PrintIt::VERSION
  spec.authors       = ["ArchimedesPi"]
  spec.email         = ["archimedespi3141@gmail.com"]
  spec.summary       = "Large 3d print job automator/batcher"
  spec.description   = "Automates long running, heinous, (especially part creation) 3d-prints"
  spec.homepage      = "http://archimedespi.github.io/printit"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  
  spec.add_dependency 'thor', '~> 0.19.1'
  spec.add_dependency 'oj', '~> 2.9.3'
  spec.add_dependency 'multi_json', '~> 1.10.0'
  spec.add_dependency 'ruby-progressbar', '~> 1.5.1'
end
