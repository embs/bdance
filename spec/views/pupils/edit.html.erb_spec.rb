require 'spec_helper'

describe "pupils/edit" do
  before(:each) do
    @pupil = assign(:pupil, stub_model(Pupil,
      :first_name => "MyString",
      :last_name => "MyString",
      :username => "MyString",
      :email => "MyString",
      :rg => "MyString",
      :cpf => "MyString",
      :birth => "MyString",
      :phone => "MyString",
      :profession => "MyString",
      :observations => "MyString"
    ))
  end

  it "renders the edit pupil form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pupil_path(@pupil), "post" do
      assert_select "input#pupil_first_name[name=?]", "pupil[first_name]"
      assert_select "input#pupil_last_name[name=?]", "pupil[last_name]"
      assert_select "input#pupil_username[name=?]", "pupil[username]"
      assert_select "input#pupil_email[name=?]", "pupil[email]"
      assert_select "input#pupil_rg[name=?]", "pupil[rg]"
      assert_select "input#pupil_cpf[name=?]", "pupil[cpf]"
      assert_select "select#pupil_birth_1i[name=?]", "pupil[birth(1i)]"
      assert_select "select#pupil_birth_2i[name=?]", "pupil[birth(2i)]"
      assert_select "select#pupil_birth_3i[name=?]", "pupil[birth(3i)]"
      assert_select "input#pupil_phone[name=?]", "pupil[phone]"
      assert_select "input#pupil_profession[name=?]", "pupil[profession]"
      assert_select "input#pupil_observations[name=?]", "pupil[observations]"
    end
  end
end
