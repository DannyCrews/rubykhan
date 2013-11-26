# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubykhan/version'

Gem::Specification.new do |spec|
  spec.name          = "rubykhan"
  spec.version       = Rubykhan::VERSION
  spec.authors       = ["Dan Crews", "Abby Howell"]
  spec.email         = ["abbyghowell@gmail.com", "dancrews@me.com"]
  spec.description   = %q{A Ruby wrapper for the Khan Academy API}
  spec.summary       = %q{Simplififies API requests}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency 'hashie', '~> 2.0'
  spec.add_dependency 'json', '~> 1.8'
  spec.add_dependency 'rash', '~> 0.4'
end
