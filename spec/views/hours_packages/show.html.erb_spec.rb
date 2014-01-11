require 'spec_helper'

describe "hours_packages/show" do
  before(:each) do
    @hours_package = assign(:hours_package, stub_model(HoursPackage,
      :pupils => [],
      :teacher => FactoryGirl.create(:teacher),
      :price => 1.5,
      :horaries => []
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Horaries/)
  end
end
