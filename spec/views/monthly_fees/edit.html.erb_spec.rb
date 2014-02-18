require 'spec_helper'

describe "monthly_fees/edit" do
  let(:pupil) { FactoryGirl.create(:pupil) }

  before(:each) do
    @monthly_fee = assign(:monthly_fee, stub_model(MonthlyFee,
      :id => "MyString",
      :amount => "MyString",
      :due_date => "MyString",
      :pupil => pupil
    ))
    @pupil = assign(:pupil, pupil)
  end

  it "renders the edit monthly_fee form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pupil_monthly_fee_path(@pupil, @monthly_fee), "post" do
      assert_select "input#monthly_fee_amount[name=?]", "monthly_fee[amount]"
      assert_select "select#monthly_fee_due_date_3i[name=?]", "monthly_fee[due_date(3i)]"
      assert_select "select#monthly_fee_due_date_2i[name=?]", "monthly_fee[due_date(2i)]"
      assert_select "select#monthly_fee_due_date_1i[name=?]", "monthly_fee[due_date(1i)]"
    end
  end
end
