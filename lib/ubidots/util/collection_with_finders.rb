class CollectionWithFinders < Array
  def find(id)
    self.find_all { |item| p item.send(:primary_key) == id }.first
  end
end
