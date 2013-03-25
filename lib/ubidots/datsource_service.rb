require 'ubidots/datasource'

module Ubidots
  class DataSourceService
    def self.retrieve_for_user(username)
      url = "#{API_URL}/users/#{username}/datasources/"
      response = RestClient.get url, { "X-UbidotsApiKey" => @@key }
      Datasource.from_collection(JSON.parse(response.body))
    end
  end
end
