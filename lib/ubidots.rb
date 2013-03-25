require "rest_client"
require "json"
require "ubidots/version"
require "ubidots/constants"
require "ubidots/user"

module Ubidots
  include Constants

  def self.api_key(key=nil)
    raise "Invalid API key: #{key}" if key.nil?

    url = "#{API_URL}/auth/token/"
    @@key = key
    response = RestClient.post url, { "X-UbidotsApiKey" => @@key }
    @@token = JSON.parse(response.body)['token']
  end

  protected

  def default_headers
    raise "Default headers not set (unknown token)" if @@token.nil?
    { "X-Auth-Token" => @@token }
  end
end
