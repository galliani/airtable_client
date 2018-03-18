require 'airtable/version'
require 'airtable/configuration'
require 'airtable/api'
require 'airtable/client'

module Airtable
  extend Configuration

  def self.client(options = {})
    Airtable::Client.new(options)
  end

  # Delegate to Instagram::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  # Delegate to Instagram::Client
  def self.respond_to?(method, include_all=false)
    return client.respond_to?(method, include_all) || super
  end  
end
