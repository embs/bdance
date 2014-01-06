require 'spec_helper'

describe "hours_packages/edit" do
  before(:each) do
    @hours_package = assign(:hours_package, stub_model(HoursPackage,
      :pupils => [],
      :teacher => nil,
      :price => 1.5,
      :horaries => []
    ))
  end

  xit "renders the edit hours_package form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", hours_package_path(@hours_package), "post" do
      assert_select "input#hours_package_pupils[name=?]", "hours_package[pupils]"
      assert_select "input#hours_package_teacher[name=?]", "hours_package[teacher]"
      assert_select "input#hours_package_price[name=?]", "hours_package[price]"
      assert_select "input#hours_package_horaries[name=?]", "hours_package[horaries]"
    end
  end
end
