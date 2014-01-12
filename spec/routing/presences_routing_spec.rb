require "spec_helper"

describe PresencesController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/presences").to route_to("presences#index")
    end

    it "routes to #new" do
      expect(:get => "/presences/new").to route_to("presences#new")
    end

    it "routes to #show" do
      expect(:get => "/presences/1").to route_to("presences#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/presences/1/edit").to route_to("presences#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/presences").to route_to("presences#create")
    end

    it "routes to #update" do
      expect(:put => "/presences/1").to route_to("presences#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/presences/1").to route_to("presences#destroy", :id => "1")
    end

  end
end
