$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "static_content/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "static_content"
  s.version     = StaticContent::VERSION
  s.authors     = ["Pedro Nascimento", "Sylvestre Mergulhao", "Rodrigo Pinto", "Mauro George"]
  s.email       = ["pedro@helabs.com.br"]
  s.homepage    = "https://github.com/Helabs/static_content"
  s.summary     = "static_content provides a simple way of outputting static content in your app."
  s.description = s.summary

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 3.2.6", "< 5"
  s.add_dependency "rdiscount", "~> 2.1.6"

  s.post_install_message = "StaticContent is deprecated and will not be maintained anymore. Instead, use phrasing (https://github.com/infinum/phrasing) that does the same with some plus."

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "coveralls"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "appraisal"
end
