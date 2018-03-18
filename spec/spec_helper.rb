require "bundler/setup"
require "airtable"
require 'webmock/rspec'
require 'capybara/rspec'
require 'json'
require 'byebug'

require 'support/fixture_support'

WebMock.disable_net_connect!

RSpec.configure do |config|
  config.include FixtureSupport
  
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.run_all_when_everything_filtered = true
  config.order = 'random'
end
