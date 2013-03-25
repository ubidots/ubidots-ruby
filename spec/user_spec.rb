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
      Ubidots::UserService.should_receive(:retrieve).with(42).and_return(params)
      user = Ubidots::User.find(42)
      user.datasources.should == []
      user.following.should == 12
    end

    it "returns nil if no user is found" do
      Ubidots::UserService.should_receive(:retrieve).with(42).and_return(nil)
      user = Ubidots::User.find(42)
      user.should be_nil
    end
  end
end
