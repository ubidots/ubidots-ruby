require 'ubidots/user_service'

module Ubidots
  class User
    attr_reader :datasources, :variables, :followers, :following
    attr_reader :created_at, :blog, :username, :profile

    def initialize(params={})
      @profile = params
      @profile.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def self.find(username)
      data = UserService.retrieve(username)
      return nil if data.nil?
      User.new(data.merge( username: username ))
    end

    def datasources
      DatasourceService.retrieve(username).to_collection_with_finders
    end
  end
end
