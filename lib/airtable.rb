require "airtable/version"

module Airtable
  BASE_URL = 'https://api.airtable.com/'
  BASE_VERSION = 'v0'

  def initialize(api_key:)
    @api_key = api_key
    # Xendit requires us to use token in every request
    # This is how to get the token, appending colon at the end then encode it
    @token = Base64.strict_encode64(api_key + ':')
    setup_connection
  end  
end
