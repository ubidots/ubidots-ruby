require 'ubidots/datasource'

module Ubidots
  class DatasourceService
    def self.retrieve(username)
      url = "#{Ubidots::API_URL}/users/#{username}/datasources/"
      response = RestClient.get url, { "X-UbidotsApiKey" => @@key }
      JSON.parse(response.body).to_collection_with_finders
    end

    def self.retrieve_without_username
      url = "#{Ubidots::API_URL}/users/datasources/"
      response = RestClient.get url, Ubidots::default_headers
      JSON.parse(response.body).to_collection_with_finders
    end
  end
end
