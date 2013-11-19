# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'audio_vision/version'

Gem::Specification.new do |spec|
  spec.name          = "audio_vision"
  spec.version       = AudioVision::VERSION
  spec.authors       = ["Bryan Ricker"]
  spec.email         = ["bricker@kpcc.org"]
  spec.description   = %q{Ruby client for the AudioVision API.}
  spec.summary       = %q{Ruby client for the AudioVision API.}
  spec.homepage      = "https://github.com/SCPR/audio_vision-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 0.8.8"
  spec.add_dependency "faraday_middleware", "~> 0.9.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
end
