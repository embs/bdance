require 'spec_helper'

describe "enrollments/index" do
  before(:each) do
    assign(:enrollments, [
      stub_model(Enrollment,
        :pupil => Pupil.new(first_name: 'Anakin'),
        :group => Group.new(name: 'Salao I')
      ),
      stub_model(Enrollment,
        :pupil => Pupil.new(first_name: 'Anakin'),
        :group => Group.new(name: 'Salao I')
      )
    ])
  end

  it "renders a list of enrollments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Anakin".to_s, :count => 2
    assert_select "tr>td", :text => "Salao I".to_s, :count => 2
  end
end
