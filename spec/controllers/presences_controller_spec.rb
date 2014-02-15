require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe PresencesController do

  let(:pupil) { FactoryGirl.create(:pupil) }

  # This should return the minimal set of attributes required to create a valid
  # Presence. As you add validations to Presence, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { FactoryGirl.attributes_for(:presence, user: pupil.user) }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PresencesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    before do
      @user_presence = Presence.create! valid_attributes  # presença do usuário
      2.times { Presence.create(user: stub_model(User)) } # outras presenças
    end

    it "assigns all user presences as @presences" do
      get :index, { user_id: pupil.user.to_param }, valid_session
      expect(assigns(:presences)).to eq([@user_presence])
    end
  end

  describe "GET new" do
    it "assigns a new presence as @presence" do
      get :new, {}, valid_session
      expect(assigns(:presence)).to be_a_new(Presence)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Presence" do
        expect {
          post :create, {:presence => valid_attributes}, valid_session
        }.to change(Presence, :count).by(1)
      end

      it "assigns a newly created presence as @presence" do
        post :create, {:presence => valid_attributes}, valid_session
        expect(assigns(:presence)).to be_a(Presence)
        expect(assigns(:presence)).to be_persisted
      end

      it "redirects to the user presences" do
        post :create, {:presence => valid_attributes}, valid_session
        expect(response).to redirect_to(user_presences_path(pupil.user))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved presence as @presence" do
        # Trigger the behavior that occurs when invalid params are submitted
        Presence.any_instance.stub(:save).and_return(false)
        post :create, {:presence => { "user" => nil }}, valid_session
        expect(assigns(:presence)).to be_a_new(Presence)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Presence.any_instance.stub(:save).and_return(false)
        post :create, {:presence => { "user" => nil }}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested presence" do
      presence = Presence.create! valid_attributes
      expect {
        delete :destroy, {:id => presence.to_param}, valid_session
      }.to change(Presence, :count).by(-1)
    end

    it "redirects to the presences list" do
      presence = Presence.create! valid_attributes
      delete :destroy, {:id => presence.to_param}, valid_session
      expect(response).to redirect_to(user_presences_url(pupil.user))
    end
  end

end
