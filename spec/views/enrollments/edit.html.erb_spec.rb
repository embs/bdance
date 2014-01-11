require 'spec_helper'

describe "enrollments/edit" do
  before(:each) do
    @enrollment = assign(:enrollment, stub_model(Enrollment,
      :pupil => Pupil.new(first_name: 'Anakin'),
      :group => Group.new(name: 'Salao I')
    ))
  end

  it "renders the edit enrollment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", enrollment_path(@enrollment), "post" do
      assert_select "select#enrollment_pupil[name=?]", "enrollment[pupil]"
      assert_select "select#enrollment_group[name=?]", "enrollment[group]"
    end
  end
end
