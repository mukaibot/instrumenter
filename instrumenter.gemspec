# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "instrumenter/version"

Gem::Specification.new do |spec|
  spec.name          = "instrumenter"
  spec.version       = Instrumenter::VERSION
  spec.authors       = ["Timothy Mukaibo"]
  spec.email         = ["timothy.mukaibo@gmail.com"]

  spec.summary       = "Easily add instrumentation to your Rails app"
  spec.homepage      = "https://github.com/mukaibot/instrumenter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
