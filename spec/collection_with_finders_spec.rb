require 'spec_helper'

describe CollectionWithFinders do
  describe "#initialize" do
    it "it's enumerable" do
      arr = [3, 2, 1]
      collection = CollectionWithFinders.new(arr)
      collection.sort.should == [1, 2, 3]
    end
  end

  describe "#find" do
    it "finds the record by providing the primary key" do
      arr = ["foo", "ohnoes", "nowai"].to_collection_with_finders
      arr.find(3).should == "foo"
    end
  end
end
