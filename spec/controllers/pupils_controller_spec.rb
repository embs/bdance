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

describe PupilsController do
  include Devise::TestHelpers
  let(:manager) { FactoryGirl.create(:manager) }

  # This should return the minimal set of attributes required to create a valid
  # Pupil. As you add validations to Pupil, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { attributes_for(:pupil) }

  before do
    sign_in manager.user
  end

  describe "GET index" do
    it "assigns all pupils as @pupils" do
      pupil = Pupil.create! valid_attributes
      get :index, {}
      expect(assigns(:pupils)).to eq([pupil])
    end
  end

  describe "GET show" do
    it "assigns the requested pupil as @pupil" do
      pupil = Pupil.create! valid_attributes
      get :show, {:id => pupil.to_param}
      expect(assigns(:pupil)).to eq(pupil)
    end
  end

  describe "GET new" do
    it "assigns a new pupil as @pupil" do
      get :new, {}
      expect(assigns(:pupil)).to be_a_new(Pupil)
    end
  end

  describe "GET edit" do
    it "assigns the requested pupil as @pupil" do
      pupil = Pupil.create! valid_attributes
      get :edit, {:id => pupil.to_param}
      expect(assigns(:pupil)).to eq(pupil)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Pupil" do
        expect {
          post :create, {:pupil => valid_attributes}
        }.to change(Pupil, :count).by(1)
      end

      it "assigns a newly created pupil as @pupil" do
        post :create, {:pupil => valid_attributes}
        expect(assigns(:pupil)).to be_a(Pupil)
        expect(assigns(:pupil)).to be_persisted
      end

      it "redirects to the created pupil" do
        post :create, {:pupil => valid_attributes}
        expect(response).to redirect_to(Pupil.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved pupil as @pupil" do
        # Trigger the behavior that occurs when invalid params are submitted
        Pupil.any_instance.stub(:save).and_return(false)
        post :create, {:pupil => { "first_name" => "invalid value" }}
        expect(assigns(:pupil)).to be_a_new(Pupil)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Pupil.any_instance.stub(:save).and_return(false)
        post :create, {:pupil => { "first_name" => "invalid value" }}
        expect(response).to render_template("new")
      end
    end

    describe "with password confirmation that doesn't match password" do
      it "raises error" do
        password_attrs = { password: '12345678', password_confirmation: '87654321'}
        post :create, {:pupil => valid_attributes.merge(password_attrs)}
        expect(assigns(:pupil)).to be_a_new(Pupil)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested pupil" do
        pupil = Pupil.create! valid_attributes
        # Assuming there are no other pupils in the database, this
        # specifies that the Pupil created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(Pupil).to receive(:update).with({ "first_name" => "MyString" })
        put :update, {:id => pupil.to_param, :pupil => { "first_name" => "MyString" }}
      end

      it "assigns the requested pupil as @pupil" do
        pupil = Pupil.create! valid_attributes
        put :update, {:id => pupil.to_param, :pupil => valid_attributes}
        expect(assigns(:pupil)).to eq(pupil)
      end

      it "redirects to the pupil" do
        pupil = Pupil.create! valid_attributes
        put :update, {:id => pupil.to_param, :pupil => valid_attributes}
        expect(response).to redirect_to(pupil)
      end
    end

    describe "with invalid params" do
      it "assigns the pupil as @pupil" do
        pupil = Pupil.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Pupil.any_instance.stub(:save).and_return(false)
        put :update, {:id => pupil.to_param, :pupil => { "first_name" => "invalid value" }}
        expect(assigns(:pupil)).to eq(pupil)
      end

      it "re-renders the 'edit' template" do
        pupil = Pupil.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Pupil.any_instance.stub(:save).and_return(false)
        put :update, {:id => pupil.to_param, :pupil => { "first_name" => "invalid value" }}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested pupil" do
      pupil = Pupil.create! valid_attributes
      expect {
        delete :destroy, {:id => pupil.to_param}
      }.to change(Pupil, :count).by(-1)
    end

    it "redirects to the pupils list" do
      pupil = Pupil.create! valid_attributes
      delete :destroy, {:id => pupil.to_param}
      expect(response).to redirect_to(pupils_url)
    end
  end

end
