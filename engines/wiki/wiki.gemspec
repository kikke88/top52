$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "wiki/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "wiki"
  s.version     = Wiki::VERSION
  s.authors     = ["N1"]
  s.email       = ["n1@mail.ru"]
  s.homepage    = "http://www.real.com"
  s.summary     = "summ."
  s.description = "desc."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0"
  s.add_dependency "activerecord-jdbcpostgresql-adapter"
  s.add_dependency "slim"
  s.add_dependency "bootstrap_form"
  s.add_dependency "maymay"

  s.test_files = Dir["spec/**/*"]
end
