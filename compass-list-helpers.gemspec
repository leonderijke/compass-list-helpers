Gem::Specification.new do |s|
  # Release Specific Information
  s.version = "0.1.0"
  s.date = "2013-07-25"

  # Gem Details
  s.name = "compass-list-helpers"
  s.summary = %q{Useful list helper functions for Sass, packaged as a Compass extension.}
  s.description = %q{List Helpers is a Compass extension providing useful list helper functions like: map, filter, reduce, every and some.}
  s.authors = ["Leon de Rijke"]
  s.email = ["leon@leonderijke.nl"]
  s.homepage = "https://github.com/leonderijke/compass-list-helpers"
  s.license = "MIT"

  # Gem Files
  s.files = ["README.md"]
  s.files += ["CHANGELOG.md"]
  s.files += Dir.glob("lib/**/*.*")
  s.files += Dir.glob("stylesheets/**/*.*")

  # Gems Dependencies
  s.add_dependency("sass",      [">=3.2.0"])
  s.add_dependency("compass",   [">= 0.12.1"])
end