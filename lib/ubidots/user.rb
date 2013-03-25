require 'ubidots/user_service'

module Ubidots
  class User
    attr_reader :datasources, :variables, :followers, :following
    attr_reader :created_at, :blog

    def initialize(params={})
      @instance = params
      params.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def self.find(user_id)
      data = UserService.retrieve(user_id)
      return nil if data.nil?
      User.new(data)
    end
  end
end
