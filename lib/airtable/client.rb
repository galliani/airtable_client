require 'faraday'
require 'uri'
require 'json'

module Airtable
  class Client < API

    def list_records(table_name:, params: {})
      @connection = Faraday.new(url:  versioned_base_endpoint_url) do |faraday|
        # faraday.use FaradayMiddleware::RaiseHttpException
        faraday.response  :logger                  # log requests to STDOUT
        faraday.request   :url_encoded
        faraday.adapter   Faraday.default_adapter  # make requests with Net::HTTP
      end

      @connection.authorization(:Bearer, Airtable.api_key)

      response = @connection.get do |req|
        req.url URI.escape(table_name)
        req.params['maxRecords'] = 100
      end

      response.body
    end

  end
end