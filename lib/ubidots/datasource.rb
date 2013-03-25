module Ubidots
  class Datasource
    def initialize
    end

    def from_collection(sources)
      sources = sources.map { |source| Datasource.new(source) }

    end
  end
end
