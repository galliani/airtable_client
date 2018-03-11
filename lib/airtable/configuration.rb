module Airtable
  module Configuration
    # An array of valid keys in the options hash when configuring a {Instagram::API}
    VALID_OPTIONS_KEYS = [
      :api_key
    ].freeze

    attr_accessor *VALID_OPTIONS_KEYS

    # Convenience method to allow configuration options to be set in a block
    # To be called from the base class
    def configure
      yield self
    end

    # Reset all configuration options to defaults
    def reset
      self.api_key       = nil
    end    
  end
end