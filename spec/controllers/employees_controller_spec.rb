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

describe EmployeesController do

  # This should return the minimal set of attributes required to create a valid
  # Employee. As you add validations to Employee, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { attributes_for :employee }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EmployeesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all employees as @employees" do
      employee = Employee.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:employees)).to eq([employee])
    end
  end

  describe "GET show" do
    it "assigns the requested employee as @employee" do
      employee = Employee.create! valid_attributes
      get :show, {:id => employee.to_param}, valid_session
      expect(assigns(:employee)).to eq(employee)
    end
  end

  describe "GET new" do
    it "assigns a new employee as @employee" do
      get :new, {}, valid_session
      expect(assigns(:employee)).to be_a_new(Employee)
    end
  end

  describe "GET edit" do
    it "assigns the requested employee as @employee" do
      employee = Employee.create! valid_attributes
      get :edit, {:id => employee.to_param}, valid_session
      expect(assigns(:employee)).to eq(employee)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Employee" do
        expect {
          post :create, {:employee => valid_attributes}, valid_session
        }.to change(Employee, :count).by(1)
      end

      it "creates an Employee with arbitrary responsibility" do
        post :create, {:employee => valid_attributes}, valid_session
        Employee.last.responsibility.should == valid_attributes[:responsibility]
      end

      it "creates a new Teacher" do
        expect {
          post :create, { employee: (attributes_for :teacher)}, valid_session
        }.to change(Teacher, :count).by(1)
      end

      it "creates a new Manager" do
        expect {
          post :create, { employee: (attributes_for :manager)}, valid_session
        }.to change(Manager, :count).by(1)
      end

      it "assigns a newly created employee as @employee" do
        post :create, {:employee => valid_attributes}, valid_session
        expect(assigns(:employee)).to be_a(Employee)
        expect(assigns(:employee)).to be_persisted
      end

      it "redirects to the created employee" do
        post :create, {:employee => valid_attributes}, valid_session
        expect(response).to redirect_to(Employee.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved employee as @employee" do
        # Trigger the behavior that occurs when invalid params are submitted
        Employee.any_instance.stub(:save).and_return(false)
        post :create, {:employee => { "first_name" => "invalid value" }}, valid_session
        expect(assigns(:employee)).to be_a_new(Employee)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Employee.any_instance.stub(:save).and_return(false)
        post :create, {:employee => { "first_name" => "invalid value" }}, valid_session
        expect(response).to render_template("new")
      end
    end

    describe "with password confirmation that doesn't match password" do
      it "raises error" do
        password_attrs = { password: '12345678', password_confirmation: '87654321'}
        post :create, {:employee => valid_attributes.merge(password_attrs)}, valid_session
        expect(assigns(:employee)).to be_a_new(Employee)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested employee" do
        employee = Employee.create! valid_attributes
        # Assuming there are no other employees in the database, this
        # specifies that the Employee created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(Employee).to receive(:update).with({ "first_name" => "MyString" })
        put :update, {:id => employee.to_param, :employee => { "first_name" => "MyString" }}, valid_session
      end

      it "assigns the requested employee as @employee" do
        employee = Employee.create! valid_attributes
        put :update, {:id => employee.to_param, :employee => valid_attributes}, valid_session
        expect(assigns(:employee)).to eq(employee)
      end

      it "redirects to the employee" do
        employee = Employee.create! valid_attributes
        put :update, {:id => employee.to_param, :employee => valid_attributes}, valid_session
        expect(response).to redirect_to(employee)
      end

      describe "without changing responsibility" do
        before { @employee = Employee.create! valid_attributes }

        it "does not destroy employee user" do
          put :update, {id: @employee.to_param, employee: { first_name: "Chefe",
            responsibility: @employee.responsibility }}, valid_session
          expect {
            User.find(@employee.user.id)
          }.not_to raise_error
        end

        it "does not destroy employee" do
          put :update, {id: @employee.to_param, employee: { first_name: "Chefe",
            responsibility: @employee.responsibility }}, valid_session
          expect {
            Employee.find(@employee.id)
          }.not_to raise_error
        end
      end
    end

    describe "with invalid params" do
      it "assigns the employee as @employee" do
        employee = Employee.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Employee.any_instance.stub(:save).and_return(false)
        put :update, {:id => employee.to_param, :employee => { "first_name" => "invalid value" }}, valid_session
        expect(assigns(:employee)).to eq(employee)
      end

      it "re-renders the 'edit' template" do
        employee = Employee.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Employee.any_instance.stub(:save).and_return(false)
        put :update, {:id => employee.to_param, :employee => { "first_name" => "invalid value" }}, valid_session
        expect(response).to render_template("edit")
      end
    end

    describe "changing employee responsibility" do

      describe "from teacher to manager" do
        before { @teacher = FactoryGirl.create(:teacher) }

        it "destroys teacher" do
          expect {
            put :update, {id: @teacher.to_param, employee: { responsibility: 'Manager' } }, valid_session
          }.to change(Teacher, :count).by(-1)
        end

        it "creates manager" do
          expect {
            put :update, {id: @teacher.to_param, employee: { responsibility: 'Manager' } }, valid_session
          }.to change(Manager, :count).by(1)
        end

        it "keeps teacher attributes but responsibility" do
          put :update, {id: @teacher.to_param, employee: { responsibility: 'Manager' } }, valid_session
          manager = Manager.last
          manager.responsibility.should == 'Manager'
          @teacher.attributes.except(:responsibility).each do |k,v|
            manager.send(k.to_sym).to_s.should eq v.to_s
          end
        end

        it "keeps user password" do
          put :update, {id: @teacher.to_param, employee: { responsibility: 'Manager' } }, valid_session
          Employee.last.encrypted_password.should eq @teacher.encrypted_password
        end

        it "destroys old employee" do
          put :update, {id: @teacher.to_param, employee: { responsibility: 'Manager' } }, valid_session
          expect {
            Employee.find(@teacher.employee.id)
          }.to raise_error(ActiveRecord::RecordNotFound)
        end

        it "destroys old user" do
          put :update, {id: @teacher.to_param, employee: { responsibility: 'Manager' } }, valid_session
          expect {
            User.find(@teacher.user.id)
          }.to raise_error(ActiveRecord::RecordNotFound)
        end

        it "changes user associated to existing phone numbers from manager" do
          phone_number = PhoneNumber.create(number: 87654321, user: @teacher.user)
          put :update, {id: @teacher.to_param, employee: { responsibility: 'Manager',
            phone_number_attributes: { "26548" => phone_number.attributes } } }, valid_session
          Employee.last.phone_numbers.should include(phone_number)
        end
      end

      describe "from manager to teacher" do
        before { @manager = FactoryGirl.create(:manager) }

        it "destroys manager" do
          expect {
            put :update, {id: @manager.to_param, employee: { responsibility: 'Teacher' } }, valid_session
          }.to change(Manager, :count).by(-1)
        end

        it "creates teacher" do
          expect {
            put :update, {id: @manager.to_param, employee: { responsibility: 'Teacher' } }, valid_session
          }.to change(Teacher, :count).by(1)
        end

        it "keeps manager attributes but responsibility" do
          put :update, {id: @manager.to_param, employee: { responsibility: 'Teacher' } }, valid_session
          teacher = Teacher.last
          @manager.attributes.except(:responsibility).each do |k,v|
            teacher.send(k.to_sym).to_s.should eq v.to_s
          end
        end
      end

      describe "from teacher to jedi" do
        before { @teacher = FactoryGirl.create(:teacher) }

        it "destroys teacher" do
          expect {
            put :update, {id: @teacher.to_param, employee: { responsibility: 'Jedi' } }, valid_session
          }.to change(Teacher, :count).by(-1)
        end

        it "creates jedi" do
          put :update, {id: @teacher.to_param, employee: { responsibility: 'Jedi' } }, valid_session
          Employee.last.responsibility.should == 'Jedi'
        end

        it "does not create a manager" do
          expect {
            put :update, {id: @teacher.to_param, employee: { responsibility: 'Jedi' } }, valid_session
          }.to change(Manager, :count).by(0)
        end

        it "keeps teacher attributes but responsibility" do
          put :update, {id: @teacher.to_param, employee: { responsibility: 'Jedi' } }, valid_session
          jedi = Employee.last
          jedi.responsibility.should == 'Jedi'
          @teacher.attributes.except(:responsibility).each do |k,v|
            jedi.send(k.to_sym).to_s.should eq v.to_s
          end
        end
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested employee" do
      employee = Employee.create! valid_attributes
      expect {
        delete :destroy, {:id => employee.to_param}, valid_session
      }.to change(Employee, :count).by(-1)
    end

    it "redirects to the employees list" do
      employee = Employee.create! valid_attributes
      delete :destroy, {:id => employee.to_param}, valid_session
      expect(response).to redirect_to(employees_url)
    end
  end

end
