require 'spec_helper'

describe PresencesController do
  include Devise::TestHelpers

  let(:manager) { FactoryGirl.create(:manager) }
  let(:pupil) { FactoryGirl.create(:pupil) }

  before do
    sign_in manager.user
  end

  describe "GET index" do
    before do
      @user_presence = FactoryGirl.create(:presence, user: pupil.user)
      2.times { FactoryGirl.create(:presence, user: stub_model(User)) }
    end

    context "for one user" do
      before do
        get :index, { user_id: pupil.user.to_param }
      end

      it "assigns user as @user" do
        expect(assigns(:user)).to eq(@user_presence.user)
      end

      it "assigns all user presences as @presences" do
        expect(assigns(:presences)).to eq([@user_presence])
      end

      it "renders index" do
        expect(response).to render_template("index")
      end
    end

    context "for all users" do
      before do
        get :index
      end

      it "assigns all users with presences as @users" do
        expect(assigns(:users)).to eq(User.with_presences)
      end

      it "renders users_index" do
        expect(response).to render_template("users_index")
      end
    end
  end

  describe "GET new" do
    before do
      get :new, user_id: pupil.user
    end

    it "assigns a new presence as @presence" do
      expect(assigns(:presence)).to be_a_new(Presence)
    end

    it "assigns a new presence as @presence for @user" do
      expect(assigns(:presence).user).to eq(pupil.user)
    end

    it "assigns user as @user" do
      expect(assigns(:user)).to eq(pupil.user)
    end
  end

  describe "POST create" do
    let(:valid_attributes) { FactoryGirl.attributes_for(:presence, user: pupil.user) }

    describe "with valid params" do
      let(:valid_params) { { user_id: pupil.user, presence: valid_attributes } }

      before do
        post :create, valid_params
      end

      it "creates a new Presence properly" do
        expect(Presence.last).to eq(FactoryGirl.build(:presence, valid_attributes.merge(id: Presence.last.id)))
      end

      it "assigns a newly created presence as @presence" do
        expect(assigns(:presence)).to be_a(Presence)
      end

      it "assigns a newly persisted presence as @presence" do
        expect(assigns(:presence)).to be_persisted
      end

      it "redirects to the user presences" do
        expect(response).to redirect_to(user_presences_path(pupil.user))
      end
    end

    describe "with invalid params" do
      let(:invalid_params) { { user_id: pupil.user, presence: valid_attributes.merge(user: nil) } }

      before do
        # Trigger the behavior that occurs when invalid params are submitted
        Presence.any_instance.stub(:save).and_return(false)
        post :create, invalid_params
      end

      it "assigns a newly created but unsaved presence as @presence" do
        expect(assigns(:presence)).to be_a_new(Presence)
      end

      it "re-renders the 'new' template" do
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    let(:presence) { FactoryGirl.create(:presence) }
    let(:valid_params) { { user_id: presence.user.to_param, id: presence.to_param } }

    it "destroys the requested presence" do
      presence # força criação
      expect {
        delete :destroy, valid_params
      }.to change(Presence, :count).by(-1)
    end

    it "redirects to the presences list" do
      delete :destroy, valid_params
      expect(response).to redirect_to(user_presences_url(presence.user))
    end
  end

end
