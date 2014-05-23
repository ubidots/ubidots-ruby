module Ubidots
  class UserService
    def self.retrieve(username)
      url = "#{Constants::API_URL}/users/#{username}/"
      response = RestClient.get url, { "X-UbidotsApiKey" => @@key }
      JSON.parse(response.body)
    end
  end
end
