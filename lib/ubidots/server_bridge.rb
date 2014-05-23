module Ubidots
  class ServerBridge

    def initialize(api_key=nil, token=nil, base_url=nil)
      @base_url = base_url ? base_url : Ubidots::Constants::API_URL
      if api_key
        @api_key = api_key
        set_api_key_header
        get_token
        set_token_header
      elsif token
        @api_key = nil
        @token = token
        set_token_header
      end
    end

    private 

    def get_token
      endpoint = "auth/token/"
      response = post_with_apikey endpoint
      @token = response['token']
    end

    def set_api_key_header
      @apikey_header = { 'X-UBIDOTS-APIKEY' => @api_key }
    end

    def set_token_header
      @token_header = { 'X-AUTH-TOKEN' => @token }
    end

    def prepare_data(data)
      return data
    end
  
    public

    def post_with_apikey(endpoint)
      headers = @apikey_header
      response = RestClient.post "#{@api_key}#{endpoint}", {}, headers
      return JSON.parse(response.body)
    end

    def get(endpoint)
      headers = @token_header
      response = RestClient.get "#{@api_key}#{endpoint}", headers
      return JSON.parse(response.body)
    end
        
    def get_with_url(url)
      headers = @token_header
      response = RestClient.get url, headers
      return JSON.parse(response.body)
    end


    def post(path, data)
      headers = @token_header
      data = prepare_data(data)
      response = RestClient.post "#{@base_url}#{endpoint}", data, headers
      return JSON.parse(response.body)
    end

    def delete(path)
      headers = @token_header
      response = RestClient.delete "#{@api_key}#{endpoint}", headers
      return JSON.parse(response.body)
    end
  end
end