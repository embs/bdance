require "spec_helper"

describe ModalitiesController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/modalities").to route_to("modalities#index")
    end

    it "routes to #new" do
      expect(:get => "/modalities/new").to route_to("modalities#new")
    end

    it "routes to #show" do
      expect(:get => "/modalities/1").to route_to("modalities#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/modalities/1/edit").to route_to("modalities#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/modalities").to route_to("modalities#create")
    end

    it "routes to #update" do
      expect(:put => "/modalities/1").to route_to("modalities#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/modalities/1").to route_to("modalities#destroy", :id => "1")
    end

  end
end
