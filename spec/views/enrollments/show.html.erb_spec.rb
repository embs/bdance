require 'spec_helper'

describe "enrollments/show" do
  before(:each) do
    @enrollment = assign(:enrollment, stub_model(Enrollment,
      :pupil => Pupil.new(first_name: 'Anakin'),
      :group => Group.new(name: 'Salao I')
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
