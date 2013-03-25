require 'spec_helper'

describe Ubidots::User do
  let(:params) { { followers: 11, following: 12 } }

  before do
    Ubidots::UserService.stub(:retrieve).and_return(params)
    Ubidots::DatasourceService.stub(:retrieve).and_return([1, 2, 3])
  end

  describe ".initialize" do
    it "automatically initializes all the object params" do
      user = Ubidots::User.new(params)
      user.followers.should == 11
      user.following.should == 12
    end
  end

  describe ".find" do
    it "finds a user through the API" do
      user = Ubidots::User.find("federico")
      user.following.should == 12
      user.username.should == "federico"
    end

    it "returns nil if no user is found" do
      Ubidots::UserService.should_receive(:retrieve).with("federico").and_return(nil)
      user = Ubidots::User.find("federico")
      user.should be_nil
    end
  end

  describe "#datasources" do
    it "returns the datasources for a given user" do
      user = Ubidots::User.find("federico")
      user.datasources.should == [1, 2 , 3]
    end
  end
end
