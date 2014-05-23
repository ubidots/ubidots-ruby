require 'ubidots/datasource_service'
module Ubidots
  class Datasource

    attr_reader :id, :name, :url, :last_activity, :tags, :description, :created_at
    attr_reader :owner, :parent, :context, :variables_url, :number_of_variables

    def initialize(data)
      @id = data["id"]
      @name = data["name"]
      @url = data["url"]
      @last_activity = data["last_activity"]
      @tags = data["tags"]
      @description = data["description"]
      @created_at = data["created_at"]
      @owner = data["owner"]
      @parent = data["parent"]
      @context = data["context"]
      @variables_url = data["variables_url"]
      @number_of_variables = data["number_of_variables"]
    end

    def get_variables
      endpoint = "datasources/#{@id}/variables"
      response = Ubidots::ApiClient::get endpoint
      raw_items = response["results"]
      return Ubidots::ApiClient::transform_to_variable_objects raw_items
    end
    

    def variables
      VariableService.retrieve_for_datasource(self)
    end

    def primary_key
      name
    end
  end
end
