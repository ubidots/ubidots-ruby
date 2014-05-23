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

  class ApiClient  
   
    def initialize(api_key=nil)
      raise "Invalid API key: #{key}" if api_key.nil?  
      @api_key = api_key
      set_api_key_header
      get_token
      set_token_header
    end

    private

    def get_token
      endpoint = "auth/token/"
      response = post_with_apikey endpoint
      @token = response['token']
    end

    def set_api_key_header
      @apikey_header = { 'X-UBIDOTS-APIKEY' => @api_key }
    end

    def set_token_header
      @token_header = { 'X-AUTH-TOKEN' => @token }
    end

    def transform_to_datasource_objects(raw_items)
      datasources = []
      raw_items.each_with_index do |raw_item, i|
        datasources[i] = Ubidots::Datasource.new(raw_item)
      end
      return datasources
    end

    def transform_to_variable_objects(raw_items)
      variables = []
      raw_items.each_with_index do |raw_item, i|
        variables[i] = Ubidots::Variable.new(raw_item)
      end
      return variables
    end

    public

    def post_with_apikey(endpoint)
      headers = @apikey_header
      response = RestClient.post "#{Ubidots::Constants::API_URL}#{endpoint}", {}, headers
      return JSON.parse(response.body)
    end

    def get(endpoint)
      headers = @token_header
      response = RestClient.get "#{Ubidots::Constants::API_URL}#{endpoint}", headers
      return JSON.parse(response.body)
    end

    def get_datasources
      response = get 'datasources'
      raw_items = response["results"]
      return transform_to_datasource_objects raw_items
    end

    def get_variables
      response = get 'variables'
      raw_items = response["results"]
      return transform_to_variable_objects raw_items
    end

    protected

    def invalid?
      !defined?(@@token) || !defined?(@@key)
    end

  end

end