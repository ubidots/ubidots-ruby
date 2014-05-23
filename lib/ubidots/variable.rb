require 'ubidots/variable_service'

module Ubidots
	class Variable

		attr_reader :id, :name, :url, :last_activity, :tags, :description, :created_at
		attr_reader :icon, :unit, :raw_datasource, :properties, :values_url, :last_value

		def initialize(data)
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

	end

end
