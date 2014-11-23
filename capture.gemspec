# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capture/version'

Gem::Specification.new do |spec|
  spec.name          = "capture"
  spec.version       = Capture::VERSION
  spec.authors       = ["Jason Chi"]
  spec.email         = ["chijinsong@gmail.com"]
  spec.summary       = %q{Caputre information from website everyday.}
  spec.description   = %q{Caputre from game}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri", "~> 1.6.4"
  spec.add_development_dependency "rubyXL", "~>3.2.7"
  spec.add_development_dependency 'simple_xlsx_writer', '~> 0.5.3'
  spec.add_development_dependency 'zip-zip', '~> 0.3'
end
