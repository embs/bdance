require 'spec_helper'

describe "monthly_fees/index" do
  before(:each) do
    assign(:monthly_fees, [
      stub_model(MonthlyFee,
        :id => "1",
        :amount => "200",
        :due_date => "2014-02-17"
      ),
      stub_model(MonthlyFee,
        :id => "2",
        :amount => "200",
        :due_date => "2014-02-17"
      )
    ])
  end

  it "renders a list of monthly_fees" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "1".to_s, :count => 1
    assert_select "tr>td", :text => "2".to_s, :count => 1
    assert_select "tr>td", :text => "200.0".to_s, :count => 2
    assert_select "tr>td", :text => "2014-02-17".to_s, :count => 2
  end
end
