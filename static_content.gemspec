$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "static_content/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "static_content"
  s.version     = StaticContent::VERSION
  s.authors     = ["Pedro Nascimento", "Sylvestre Mergulhao", "Rodrigo Pinto"]
  s.email       = ["pedro@helabs.com.br"]
  s.homepage    = "http://www.helabs.com.br"
  s.summary     = "static_content provides a simple way of outputting static content in your app."
  s.description = s.summary

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.mkdn"]

  s.add_dependency "rails", "~> 3.2.6"
  s.add_dependency "rdiscount", "~> 1.6.8"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "shoulda-matchers"
end
