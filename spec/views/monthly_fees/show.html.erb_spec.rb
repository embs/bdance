require 'spec_helper'

describe "monthly_fees/show" do
  before(:each) do
    @monthly_fee = assign(:monthly_fee, stub_model(MonthlyFee,
      :id => "1",
      :amount => "200",
      :due_date => "2014-02-17"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/1/)
    expect(rendered).to match(/200/)
    expect(rendered).to match(/2014-02-17/)
  end
end
