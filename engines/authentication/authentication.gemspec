$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "authentication/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "authentication"
  s.version     = Authentication::VERSION
  s.authors     = ["N1"]
  s.email       = ["n1@mail.ru"]
  s.homepage    = "http://www.real.com"
  s.summary     = "summ."
  s.description = "desc."
  s.license     = "MIT"
  s.platform = 'java' if RUBY_ENGINE == 'jruby'

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0"
  s.add_dependency "activerecord-jdbcpostgresql-adapter" if /java/.match(RUBY_PLATFORM)
  s.add_dependency "pg", "~> 0.18" unless /java/.match(RUBY_PLATFORM)
  
  s.add_dependency "sorcery"
  s.add_dependency "sidekiq"
  s.add_dependency "slim"
  s.add_dependency "bootstrap_form"

  s.test_files = Dir["spec/**/*"]

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "rspec-sidekiq"
end
