require 'spec_helper'

describe "Pupils" do
  let(:manager) { FactoryGirl.create(:manager) }
  let(:user) { FactoryGirl.create(:user) }

  describe "GET /pupils" do

    context 'as user' do
      before do
        post_via_redirect user_session_path, 'user[email]' => user.email, 'user[password]' => user.password
      end

      it 'redirects' do
        get pupils_path
        expect(response.status).to be(302)
      end
    end

    context 'as manager' do
      before do
        post_via_redirect user_session_path, 'user[email]' => manager.email, 'user[password]' => manager.password
      end

      it "works! (now write some real specs)" do
        get pupils_path
        expect(response.status).to be(200)
      end
    end
  end
end
