# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'satispay/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name          = 'satispay'
  s.version       = Satispay::VERSION
  s.authors       = ['Ideonetwork']
  s.email         = ['info@ideonetwork.it']
  s.homepage      = 'http://ideonetwork.it/'
  s.summary       = 'Unofficial Satispay API for Ruby'
  s.description   = 'Unofficial Satispay API for Ruby (porting from https://github.com/satispay/online-api-php-sdk)'
  s.license       = 'MIT'
  s.files         = Dir['MIT-LICENSE', 'README.md', 'lib/**/*']
  s.require_paths = ['lib']

  # Dependencies:

  s.add_runtime_dependency 'rest-client'
  s.add_runtime_dependency 'json'

  # Dev dependencies:

  s.add_development_dependency 'rspec', '~> 3.0'

end
