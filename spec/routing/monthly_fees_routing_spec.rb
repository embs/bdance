require "spec_helper"

describe MonthlyFeesController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/pupils/1/monthly_fees").to route_to("monthly_fees#index", pupil_id: "1")
    end

    it "routes to #new" do
      expect(:get => "/pupils/1/monthly_fees/new").to route_to("monthly_fees#new", pupil_id: "1")
    end

    it "routes to #show" do
      expect(:get => "/pupils/1/monthly_fees/1").to route_to("monthly_fees#show", pupil_id: "1", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pupils/1/monthly_fees/1/edit").to route_to("monthly_fees#edit", pupil_id: "1", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/pupils/1/monthly_fees").to route_to("monthly_fees#create", pupil_id: "1")
    end

    it "routes to #update" do
      expect(:put => "/pupils/1/monthly_fees/1").to route_to("monthly_fees#update", pupil_id: "1", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pupils/1/monthly_fees/1").to route_to("monthly_fees#destroy", pupil_id: "1", :id => "1")
    end

  end
end
