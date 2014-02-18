require 'spec_helper'

describe "hours_packages/index" do
  let(:teacher) { FactoryGirl.create(:teacher) }

  before(:each) do
    assign(:hours_packages, [
      stub_model(HoursPackage,
        id: 1,
        :pupils => [stub_model(Pupil, email: 'homer@simpsons.com')],
        :teacher => teacher,
        :price => 1.5,
        :horaries => []
      )
    ])
  end

  it "renders a list of hours_packages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => '1', :count => 1
  end
end
