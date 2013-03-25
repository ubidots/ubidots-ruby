require "rest_client"
require "json"
require "ubidots/version"
require "ubidots/constants"
require "ubidots/user"
require "ubidots/variable"
require "ubidots/datasource"
require "ubidots/util/collection_with_finders"
require "ubidots/util/array"

module Ubidots
  include Constants

  def self.api_key(key=nil)
    raise "Invalid API key: #{key}" if key.nil?

    url = "#{API_URL}/auth/token/"
    @@key = key
    response = RestClient.post url, { "X-UbidotsApiKey" => @@key }
    @@token = JSON.parse(response.body)['token']
  end

  def self.datasources
    DatasourceService.retrieve_without_username
  end

  def self.variables
    VariableService.retrieve_for_current_user
  end

  protected

  def invalid?
    !defined?(@@token) || !defined?(@@key)
  end

  def default_headers
    raise "Default headers not set (unknown token)" if @@token.nil?
    { "X-Auth-Token" => @@token }
  end
end
