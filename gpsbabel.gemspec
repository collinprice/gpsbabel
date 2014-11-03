# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gpsbabel/version'

Gem::Specification.new do |spec|
  spec.name          = "gpsbabel"
  spec.version       = GPSBabel::VERSION
  spec.authors       = ["Collin Price"]
  spec.email         = ["collin@collinprice.com"]
  spec.summary       = "GPSBabel Ruby wrapper."
  spec.description   = "Provides access through Ruby to the command-line application GPSBabel used to manipulate gps data files."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "cliver"
  spec.add_runtime_dependency "gpx2hash"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-nav"
end
