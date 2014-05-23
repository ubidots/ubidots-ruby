require "rest_client"
require "json"
require "ubidots/version"
require "ubidots/constants"
require "ubidots/user"
require "ubidots/variable"
require "ubidots/datasource"
require "ubidots/server_bridge"
require "ubidots/util/collection_with_finders"
require "ubidots/util/array"

module Ubidots
  include Constants

  class ApiClient  
   
    def initialize(api_key=nil, token=nil, base_url=nil, bridge=nil)
      if bridge
        @bridge = bridge
      else
        @bridge = Ubidots::ServerBridge.new(api_key, token, base_url)
      end
    end

    private

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


    def get_datasources
      response = @bridge.get 'datasources'
      raw_items = response["results"]
      return transform_to_datasource_objects raw_items
    end

    def get_variables
      response = @bridge.get 'variables'
      raw_items = response["results"]
      return transform_to_variable_objects raw_items
    end

    protected

    def invalid?
      !defined?(@@token) || !defined?(@@key)
    end

  end

end