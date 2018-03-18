module Airtable
  class API
    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    # Creates a new API
    def initialize(options={})
      options = Airtable.options.merge(options)

      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    def config
      conf = {}

      Configuration::VALID_OPTIONS_KEYS.each do |key|
        conf[key] = send key
      end

      conf
    end

    def versioned_base_endpoint_url
      config[:endpoint] + config[:api_version] + '/' + config[:base_uid] + '/'
    end
  end
end