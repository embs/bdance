require 'spec_helper'

describe "MonthlyFees" do
  let(:manager) { FactoryGirl.create(:manager) }

  before do
    post_via_redirect user_session_path, 'user[email]' => manager.email, 'user[password]' => manager.password
  end

  describe "GET /monthly_fees" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get monthly_fees_path
      expect(response.status).to be(200)
    end
  end

  describe "GET /pupils/1/monthly_fees" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get monthly_fees_path
      expect(response.status).to be(200)
    end
  end
end
