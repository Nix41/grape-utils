# frozen_string_literal: true

require "grape"
require "grape_entity"
require "grape/utils"
require "grape/utils/templates/create"
require "rack/test"

RSpec.configure do |config|
  include Rack::Test::Methods
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
