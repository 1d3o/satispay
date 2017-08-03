# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name          = 'satispay'
  s.version       = '1.0.1'
  s.authors       = ['Ideonetwork']
  s.email         = ['info@ideonetwork.it']
  s.homepage      = 'http://naturaldesign.cc/'
  s.summary       = 'Unofficial Satispay API for Ruby'
  s.description   = 'Unofficial Satispay API for Ruby (porting from https://github.com/satispay/online-api-php-sdk)'
  s.license       = 'MIT'
  s.require_paths = ['lib']
  s.files         = Dir['lib/satispay.rb', 'MIT-LICENSE', 'Rakefile', 'README.md']

  # Dependencies:

  s.add_runtime_dependency 'rest-client'
  s.add_runtime_dependency 'json'

  # Dev dependencies:

  s.add_development_dependency 'rspec'

end
