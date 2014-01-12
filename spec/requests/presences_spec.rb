require 'spec_helper'

describe "Presences" do
  describe "GET /user/:user_id/presences" do
    let(:user) { FactoryGirl.create(:user) }

    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get user_presences_path(user_id: user.to_param)
      expect(response.status).to be(200)
    end
  end
end
