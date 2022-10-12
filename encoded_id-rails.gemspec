# frozen_string_literal: true

require_relative "lib/encoded_id/rails/version"

Gem::Specification.new do |spec|
  spec.name = "encoded_id-rails"
  spec.version = EncodedId::Rails::VERSION
  spec.authors = ["Stephen Ierodiaconou"]
  spec.email = ["stevegeek@gmail.com"]

  spec.summary = "Use EncodedIds with ActiveRecord models"
  spec.description = "Write a longer description or delete this line."
  spec.homepage = "https://github.com/stevegeek/encoded_id-rails"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/stevegeek/encoded_id-rails"
  spec.metadata["changelog_uri"] = "https://github.com/stevegeek/encoded_id-rails/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "activesupport", ">= 6.0"
  spec.add_dependency "activerecord", ">= 6.0"
  spec.add_dependency "encoded_id", "~> 0.3"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
