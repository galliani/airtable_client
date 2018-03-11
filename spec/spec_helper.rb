require "bundler/setup"
require "airtable_client"
require 'webmock/rspec'
require 'capybara/rspec'
require 'json'

WebMock.disable_net_connect!

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

	config.treat_symbols_as_metadata_keys_with_true_values = true 
	config.run_all_when_everything_filtered = true
	config.filter_run :focus 
  config.order = 'random' 

  # Stubs
  # config.before(:each) do
  #   stub_request(:get, 'url')
  #     .with(
  #       headers: {
  #         'Accept' => '*/*',
  #         'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
  #         'User-Agent' => 'Ruby'
  #       }
  #      )
  #     .to_return(
  #       status: 200,
  #       body: '{"status": 200, "success": true, "result": []}',
  #       headers: {}
  #      )
  # end    
end
