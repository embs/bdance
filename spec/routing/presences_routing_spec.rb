require "spec_helper"

describe PresencesController do
  describe "routing" do

    let(:user) { stub_model(User) }

    it "routes to #index" do
      expect(:get => "user/#{user.to_param}/presences").to route_to("presences#index", user_id: user.to_param)
    end

    it "routes to #new" do
      expect(:get => "/presences/new").to route_to("presences#new")
    end

    it "routes to #create" do
      expect(:post => "/presences").to route_to("presences#create")
    end

    it "routes to #destroy" do
      expect(:delete => "/presences/1").to route_to("presences#destroy", :id => "1")
    end

  end
end
