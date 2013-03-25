require 'spec_helper'

describe Ubidots do
  describe ".datasources" do
    it "returns a list of data sources" do
      Ubidots::DatasourceService.stub(:retrieve_without_username).and_return([1, 2, 3])
      Ubidots.datasources.should == [1, 2, 3]
    end

    it "returns a collection with finders" do
      expected = ["foo", "baaar"].to_collection_with_finders
      Ubidots::DatasourceService.stub(:retrieve_without_username).and_return(expected)
      Ubidots.datasources.find(3).should == "foo"
    end
  end
end
