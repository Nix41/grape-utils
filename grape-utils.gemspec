# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("lib", __dir__)
require_relative "lib/grape_utils/version"

Gem::Specification.new do |spec|
  spec.name = "grape-utils"
  spec.version = Grape::Utils::VERSION
  spec.authors = ["Nix41"]
  spec.email = ["acprieto41@gmail.com"]

  spec.summary = "Grape Utils for building APIs"
  # spec.description = "TODO: Write a longer description or delete this line."
  spec.homepage = "https://github.com/Nix41/grape-utils"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Nix41/grape-utils"
  spec.metadata["changelog_uri"] = "https://github.com/Nix41/grape-utils/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "grape"
  spec.add_dependency "grape-entity"
  spec.add_dependency "grape-kaminari"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
