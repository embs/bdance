require 'spec_helper'

describe "HoursPackages" do
  describe "GET /hours_packages" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get hours_packages_path
      expect(response.status).to be(200)
    end
  end
end
