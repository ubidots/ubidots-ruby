require 'ubidots/variable_service'

module Ubidots
  class Variable

    attr_reader :name

    def primary_key
      name
    end
  end
end
