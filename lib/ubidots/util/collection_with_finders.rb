class CollectionWithFinders
  include Enumerable

  attr_reader :collection

  def initialize(array)
    @collection = array
  end

  def each(&block)
    collection.each(&block)
  end

  def find(id)
    collection.find_all { |item| p item.send(:primary_key) == id }.first
  end
end
