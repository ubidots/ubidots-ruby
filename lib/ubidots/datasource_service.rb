require 'ubidots/datasource'

module Ubidots
  class DatasourceService
    def self.retrieve(username)
      url = "#{Ubidots::API_URL}/users/#{username}/datasources/"
      response = RestClient.get url, { "X-UbidotsApiKey" => @@key }
      JSON.parse(response.body).to_collection_with_finders
    end
  end
end
