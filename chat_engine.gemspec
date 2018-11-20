$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "chat_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "chat_engine"
  s.version     = ChatEngine::VERSION
  s.authors     = ["Zakui"]
  s.email       = ["zakuijules@gmail.com"]
  # s.homepage    = "TODO"
  s.summary     = "A chat engine for real time chat"
  # s.description = "TODO: Description of ChatEngine."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib,public}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 5.1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "sidekiq"
  s.add_development_dependency "redis"
  s.add_dependency "toastr-rails"
  s.add_dependency "paperclip"
  s.add_dependency "cancancan"
end
