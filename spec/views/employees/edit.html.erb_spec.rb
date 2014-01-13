require 'spec_helper'

describe "employees/edit" do
  before(:each) do
    @employee = assign(:employee, stub_model(Employee,
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :username => "MyString",
      :rg => "MyString",
      :cpf => "MyString",
      :birth => "MyString",
      :phone => "MyString",
      :responsibility => "MyString",
      :wage => "MyString"
    ))
  end

  it "renders the edit employee form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", employee_path(@employee), "post" do
      assert_select "input#employee_first_name[name=?]", "employee[first_name]"
      assert_select "input#employee_last_name[name=?]", "employee[last_name]"
      assert_select "input#employee_email[name=?]", "employee[email]"
      assert_select "input#employee_username[name=?]", "employee[username]"
      assert_select "input#employee_rg[name=?]", "employee[rg]"
      assert_select "input#employee_cpf[name=?]", "employee[cpf]"
      assert_select "select#employee_birth_1i[name=?]", "employee[birth(1i)]"
      assert_select "select#employee_birth_2i[name=?]", "employee[birth(2i)]"
      assert_select "select#employee_birth_3i[name=?]", "employee[birth(3i)]"
      assert_select "a.add_nested_fields" # Adiciona números de telefone
      assert_select "select#employee_responsibility[name=?]", "employee[responsibility]"
      assert_select "input#employee_wage[name=?]", "employee[wage]"
    end
  end
end
