# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tokipona/version'

Gem::Specification.new do |spec|
  spec.name          = "tokipona"
  spec.version       = Tokipona::VERSION
  spec.authors       = ["Potapov Sergey"]
  spec.email         = ["blake131313@gmail.com"]

  spec.summary       = "Tools to process Toki Pona language"
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/greyblake/tokipona"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
