require "spec_helper"

describe PresencesController do
  describe "routing" do

    it "routes to #index for all users presences" do
      expect(get: "/presences").to route_to("presences#index")
    end

    it "routes to #index for one user presences" do
      expect(get: "users/1/presences").to route_to("presences#index", user_id: "1")
    end

    it "routes to #new" do
      expect(get: "/users/1/presences/new").to route_to("presences#new", user_id: "1")
    end

    it "routes to #create" do
      expect(post: "/users/1/presences").to route_to("presences#create", user_id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/users/1/presences/1").to route_to("presences#destroy", id: "1", user_id: "1")
    end

  end
end
