require "spec_helper"

describe HoursPackagesController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/hours_packages").to route_to("hours_packages#index")
    end

    it "routes to #new" do
      expect(:get => "/hours_packages/new").to route_to("hours_packages#new")
    end

    it "routes to #show" do
      expect(:get => "/hours_packages/1").to route_to("hours_packages#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/hours_packages/1/edit").to route_to("hours_packages#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/hours_packages").to route_to("hours_packages#create")
    end

    it "routes to #update" do
      expect(:put => "/hours_packages/1").to route_to("hours_packages#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/hours_packages/1").to route_to("hours_packages#destroy", :id => "1")
    end

  end
end
