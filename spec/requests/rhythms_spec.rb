require 'spec_helper'

describe "Rhythms" do
  describe "GET /rhythms" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get rhythms_path
      expect(response.status).to be(200)
    end
  end
end
