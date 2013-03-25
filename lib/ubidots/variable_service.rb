module Ubidots
  class VariableService
    def self.retrieve_from_datasource(source)
      url = "#{Ubidots::API_URL}/datasources/#{source.primary_key}/variables/"
      response = RestClient.get url, { "X-UbidotsApiKey" => @@key }
      JSON.parse(response.body).to_collection_with_finders
    end

    def self.retrieve_for_current_user
      url = "#{Ubidots::API_URL}/variables/"
      response = RestClient.get url, { "X-UbidotsApiKey" => @@key }
      JSON.parse(response.body).to_collection_with_finders
    end
  end
end
