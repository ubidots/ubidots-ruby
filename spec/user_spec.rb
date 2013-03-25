require 'spec_helper'

describe Ubidots::User do
  let(:params) { { datasources: [], followers: 11, following: 12 } }

  describe ".initialize" do
    it "automatically initializes all the object params" do
      user = Ubidots::User.new(params)
      user.datasources.should == []
      user.followers.should == 11
      user.following.should == 12
    end
  end

  describe ".find" do
    it "finds a user through the API" do
      Ubidots::UserService.should_receive(:retrieve).with("federico").and_return(params)
      user = Ubidots::User.find("federico")
      user.datasources.should == []
      user.following.should == 12
      user.username.should == "federico"
    end

    it "returns nil if no user is found" do
      Ubidots::UserService.should_receive(:retrieve).with("federico").and_return(nil)
      user = Ubidots::User.find("federico")
      user.should be_nil
    end
  end
end
