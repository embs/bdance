require "spec_helper"

describe EnrollmentsController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/enrollments").to route_to("enrollments#index")
    end

    it "routes to #new" do
      expect(:get => "/enrollments/new").to route_to("enrollments#new")
    end

    it "routes to #show" do
      expect(:get => "/enrollments/1").to route_to("enrollments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/enrollments/1/edit").to route_to("enrollments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/enrollments").to route_to("enrollments#create")
    end

    it "routes to #update" do
      expect(:put => "/enrollments/1").to route_to("enrollments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/enrollments/1").to route_to("enrollments#destroy", :id => "1")
    end

  end
end
