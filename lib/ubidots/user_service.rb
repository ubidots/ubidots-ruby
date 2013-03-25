module Ubidots
  class UserService
    def self.retrieve(user_id)
      url = "#{"API_URL/users/user_id"}"
      response = RestClient.get url, { "X-UbidotsApiKey" => @@key }
      JSON.parse(response.body)
    end
  end
end
