class Array
  def to_collection_with_finders
    CollectionWithFinders.new(self)
  end
end
