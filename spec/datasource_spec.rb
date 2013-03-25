require 'spec_helper'

describe Ubidots::Datasource do
  describe "#variables" do
    it "returns a list of variables" do
      source = Ubidots::Datasource.new
      Ubidots::VariableService.stub(:retrieve_for_datasource).and_return([1, 2, 3])
      source.variables.should == [1, 2, 3]
    end
  end
end
