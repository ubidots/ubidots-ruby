module Ubidots
	class Variable

		attr_reader :id, :name, :url, :last_activity, :tags, :description, :created_at
		attr_reader :icon, :unit, :raw_datasource, :properties, :values_url, :last_value

		def initialize(bridge, data)
			@bridge = bridge
			@id = data["id"]
			@name = data["name"]
			@url = data["url"]
			@last_activity = data["last_activity"]
			@tags = data["tags"]
			@description = data["description"]
			@created_at = data["created_at"]
			@icon = data["icon"]
			@unit = data["unit"]
			@raw_datasource = data["datasource"]
			@properties = data["properties"]
			@values_url = data["values_url"]
			@last_value = data["last_value"]
		end

		def get_values
			endpoint = "variables/#{@id}/values"
			response = @bridge.get endpoint
			return response 
		end

    def save_value(data)
      endpoint = "variables/#{@id}/values"
      return @bridge.post endpoint, data
    end

		def save_values(data, force=false)
			endpoint = "variables/#{@id}/values"
			if force == true
				endpoint = "#{endpoint}?force=true"
			end
			return @bridge.post endpoint, data
		end

    def remove_variable
      endpoint = "variables/#{@id}"
      return @bridge.delete endpoint
    end

    def get_datasource
      if !@datasource
      	datasource_id = @raw_datasource["id"]
      	endpoint = "datasources/#{datasource_id}"
	      response = @bridge.get endpoint
      	@datasource = Ubidots::Datasource.new(@bridge, response) 
      end
      return @datasource
    end
	end
end
