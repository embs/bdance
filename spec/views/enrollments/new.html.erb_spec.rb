require 'spec_helper'

describe "enrollments/new" do
  before(:each) do
    assign(:enrollment, stub_model(Enrollment,
      :pupil => Pupil.new(first_name: 'Anakin'),
      :group => Group.new(name: 'Salao I')
    ).as_new_record)
  end

  it "renders new enrollment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", enrollments_path, "post" do
      assert_select "input#enrollment_pupil[name=?]", "enrollment[pupil]"
      assert_select "input#enrollment_group[name=?]", "enrollment[group]"
    end
  end
end
