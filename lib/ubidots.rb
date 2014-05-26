require "rest_client"
require "json"
require "ubidots/version"
require "ubidots/constants"
require "ubidots/variable"
require "ubidots/datasource"
require "ubidots/server_bridge"

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

    public

    def get_datasources
      response = @bridge.get 'datasources'
      raw_items = response["results"]
      return @bridge.transform_to_datasource_objects raw_items
    end

    def get_variables
      response = @bridge.get 'variables'
      raw_items = response["results"]
      return @bridge.transform_to_variable_objects raw_items
    end

    def get_datasource(id=nil)
      endpoint = "datasources/#{id}"
      response = @bridge.get endpoint
      return Ubidots::Datasource.new(@bridge, response)
    end

    def create_datasource(data)
      endpoint = "datasources";
      response = @bridge.post endpoint, data
      return Ubidots::Datasource.new(@bridge, response)
    end

    def get_variable(id=nil)
      endpoint = "variables/#{id}"
      response = @bridge.get endpoint
      return Ubidots::Variable.new(@bridge, response)
    end

  end

end