require 'ubidots/datasource_service'
module Ubidots
  class Datasource

    attr_reader :name

    def initialize
      @name = "foo"
    end

    def variables
      VariableService.retrieve_for_datasource(self)
    end

    def primary_key
      name
    end
  end
end
