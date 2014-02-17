require 'spec_helper'

describe ContractsController do
  include Devise::TestHelpers
  let(:manager) { FactoryGirl.create(:manager) }
  let(:enrolled_pupil) { FactoryGirl.create(:pupil_with_enrollment) }

  before do
    sign_in manager.user
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end

    it "assigns all enrolled pupils" do
      pupils = 3.times.collect { FactoryGirl.create(:pupil_with_enrollment) }
      3.times { FactoryGirl.create(:pupil) }
      get 'index'
      expect(assigns(:pupils)).to eq(pupils << enrolled_pupil)
    end
  end

  describe "GET 'download'" do
    before do
      get :download, { contract_id: enrolled_pupil.id }
    end

    it "returns http success" do
      expect(response).to be_success
    end

    it "assigns pupil" do
      expect(assigns(:pupil)).to eq(enrolled_pupil)
    end
  end
end
