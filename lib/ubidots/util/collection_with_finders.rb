class CollectionWithFinders < Array
  def find(id)
    self.find_all { |item| item.send(:primary_key) == id }.first
  end
end
