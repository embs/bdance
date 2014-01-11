require 'spec_helper'

describe "hours_packages/index" do
  let(:teacher) { FactoryGirl.create(:teacher) }

  before(:each) do
    assign(:hours_packages, [
      stub_model(HoursPackage,
        :pupils => [],
        :teacher => teacher,
        :price => 1.5,
        :horaries => []
      ),
      stub_model(HoursPackage,
        :pupils => [],
        :teacher => teacher,
        :price => 1.5,
        :horaries => []
      )
    ])
  end

  it "renders a list of hours_packages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    # assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => teacher.email.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # assert_select "tr>td", :text => "Horaries".to_s, :count => 2
  end
end
