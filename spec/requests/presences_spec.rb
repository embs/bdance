require 'spec_helper'

describe "Presences" do
  describe "GET /user/:user_id/presences" do
    let(:user) { FactoryGirl.create(:user) }

    it "redirects" do
      get user_presences_path(user_id: user.to_param)
      expect(response.status).to be(302)
    end

    context 'as presences user owner' do
      before do
        post_via_redirect user_session_path, 'user[email]' => user.email, 'user[password]' => user.password
      end

      it 'redirects' do
        get user_presences_path(user_id: user.to_param)
        expect(response.status).to be(200)
      end
    end

    context 'as manager' do
      let(:manager) { FactoryGirl.create(:manager) }

      before do
        post_via_redirect user_session_path, 'user[email]' => manager.email, 'user[password]' => manager.password
      end

      it "gets all users presences" do
        get presences_path
        expect(response.status).to be(200)
      end

      it "gets one user presences" do
        get user_presences_path(user)
        expect(response.status).to be(200)
      end
    end
  end
end
