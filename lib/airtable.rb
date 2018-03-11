require 'airtable/version'
require 'airtable/client'
require 'airtable/configuration'

module Airtable
  extend Configuration
  API_URL = 'https://api.airtable.com/'
  API_VERSION = 'v0'

  def self.client(options = {})
    Airtable::Client.new(options)
  end  
end
