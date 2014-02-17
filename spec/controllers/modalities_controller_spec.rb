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

describe ModalitiesController do
  include Devise::TestHelpers
  let(:manager) { FactoryGirl.create(:manager) }

  # This should return the minimal set of attributes required to create a valid
  # Modality. As you add validations to Modality, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { FactoryGirl.attributes_for(:modality) }

  before do
    sign_in manager.user
  end

  describe "GET index" do
    it "assigns all modalities as @modalities" do
      modality = Modality.create! valid_attributes
      get :index, {}
      expect(assigns(:modalities)).to eq([modality])
    end
  end

  describe "GET show" do
    it "assigns the requested modality as @modality" do
      modality = Modality.create! valid_attributes
      get :show, {:id => modality.to_param}
      expect(assigns(:modality)).to eq(modality)
    end
  end

  describe "GET new" do
    it "assigns a new modality as @modality" do
      get :new, {}
      expect(assigns(:modality)).to be_a_new(Modality)
    end
  end

  describe "GET edit" do
    it "assigns the requested modality as @modality" do
      modality = Modality.create! valid_attributes
      get :edit, {:id => modality.to_param}
      expect(assigns(:modality)).to eq(modality)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Modality" do
        expect {
          post :create, {:modality => valid_attributes}
        }.to change(Modality, :count).by(1)
      end

      it "assigns a newly created modality as @modality" do
        post :create, {:modality => valid_attributes}
        expect(assigns(:modality)).to be_a(Modality)
        expect(assigns(:modality)).to be_persisted
      end

      it "redirects to the created modality" do
        post :create, {:modality => valid_attributes}
        expect(response).to redirect_to(Modality.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved modality as @modality" do
        # Trigger the behavior that occurs when invalid params are submitted
        Modality.any_instance.stub(:save).and_return(false)
        post :create, {:modality => { "name" => "invalid value" }}
        expect(assigns(:modality)).to be_a_new(Modality)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Modality.any_instance.stub(:save).and_return(false)
        post :create, {:modality => { "name" => "invalid value" }}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested modality" do
        modality = Modality.create! valid_attributes
        # Assuming there are no other modalities in the database, this
        # specifies that the Modality created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(Modality).to receive(:update).with({ "name" => "MyString" })
        put :update, {:id => modality.to_param, :modality => { "name" => "MyString" }}
      end

      it "assigns the requested modality as @modality" do
        modality = Modality.create! valid_attributes
        put :update, {:id => modality.to_param, :modality => valid_attributes}
        expect(assigns(:modality)).to eq(modality)
      end

      it "redirects to the modality" do
        modality = Modality.create! valid_attributes
        put :update, {:id => modality.to_param, :modality => valid_attributes}
        expect(response).to redirect_to(modality)
      end
    end

    describe "with invalid params" do
      it "assigns the modality as @modality" do
        modality = Modality.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Modality.any_instance.stub(:save).and_return(false)
        put :update, {:id => modality.to_param, :modality => { "name" => "invalid value" }}
        expect(assigns(:modality)).to eq(modality)
      end

      it "re-renders the 'edit' template" do
        modality = Modality.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Modality.any_instance.stub(:save).and_return(false)
        put :update, {:id => modality.to_param, :modality => { "name" => "invalid value" }}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested modality" do
      modality = Modality.create! valid_attributes
      expect {
        delete :destroy, {:id => modality.to_param}
      }.to change(Modality, :count).by(-1)
    end

    it "redirects to the modalities list" do
      modality = Modality.create! valid_attributes
      delete :destroy, {:id => modality.to_param}
      expect(response).to redirect_to(modalities_url)
    end
  end

end
