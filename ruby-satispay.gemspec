$:.push File.expand_path("../lib", __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name          = "ruby-satispay"
  s.version       = "1.0.0"
  s.authors       = ["Ideonetwork"]
  s.email         = ["info@ideonetwork.it"]
  s.homepage      = ""
  s.summary       = ""
  s.description   = ""
  s.license       = "MIT"
  s.require_paths = ["lib"]
  s.files         = Dir["lib/satispay.rb", "MIT-LICENSE", "Rakefile", "README.md"]

  # Dependencies:

  s.add_dependency "rest-client"

  # Dev dependencies:

  s.add_development_dependency "rspec"

end
