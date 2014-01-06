require "spec_helper"

describe PupilsController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/pupils").to route_to("pupils#index")
    end

    it "routes to #new" do
      expect(:get => "/pupils/new").to route_to("pupils#new")
    end

    it "routes to #show" do
      expect(:get => "/pupils/1").to route_to("pupils#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pupils/1/edit").to route_to("pupils#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/pupils").to route_to("pupils#create")
    end

    it "routes to #update" do
      expect(:put => "/pupils/1").to route_to("pupils#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pupils/1").to route_to("pupils#destroy", :id => "1")
    end

  end
end
