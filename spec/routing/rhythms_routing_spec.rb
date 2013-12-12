require "spec_helper"

describe RhythmsController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/rhythms").to route_to("rhythms#index")
    end

    it "routes to #new" do
      expect(:get => "/rhythms/new").to route_to("rhythms#new")
    end

    it "routes to #show" do
      expect(:get => "/rhythms/1").to route_to("rhythms#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/rhythms/1/edit").to route_to("rhythms#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/rhythms").to route_to("rhythms#create")
    end

    it "routes to #update" do
      expect(:put => "/rhythms/1").to route_to("rhythms#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rhythms/1").to route_to("rhythms#destroy", :id => "1")
    end

  end
end
