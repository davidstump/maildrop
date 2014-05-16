# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'maildrop/version'

Gem::Specification.new do |spec|
  spec.name          = "maildrop"
  spec.version       = Maildrop::VERSION
  spec.authors       = ["David Stump"]
  spec.email         = ["david@davidstump.net"]
  spec.summary       = %q{Write a short summary. Required.}
  spec.description   = %q{Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_runtime_dependency "rake"
  spec.add_runtime_dependency "dropbox-sdk"
  spec.add_runtime_dependency "launchy"
end
