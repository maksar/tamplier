# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tamplier/version'

Gem::Specification.new do |spec|
  spec.name          = "tamplier"
  spec.version       = Tamplier::VERSION
  spec.authors       = ["Alexander Shestakov"]
  spec.email         = ["Maksar.mail@gmail.com"]
  spec.summary       = %q{Tamplier gem provides ability to manage .yml.sample config files in your ruby projects.}
  spec.description   = <<-TXT
How many times your deploys were failed, because you forgot to update .yml files on server... No more!
Tamplier gem checks, that all keys from any .yml.sample files are actually exist in real .yml files.
That allows to detect configuration problems earlier and spend less time on deployment problems investigations.
Gem also provides command line utility to quickly setup fresh development environment by copying or symlinking .yml.sample files.
TXT
  spec.homepage      = "https://github.com/maksar/tamplier"
  spec.license       = "MIT"

  spec.files         = Dir.glob("{bin,lib,spec}/**/*")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "commander", "~> 4.2.0"
  spec.add_runtime_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rails"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "pry"
end
