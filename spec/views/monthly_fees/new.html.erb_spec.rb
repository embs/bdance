require 'spec_helper'

describe "monthly_fees/new" do
  let(:pupil) { FactoryGirl.create(:pupil) }

  before(:each) do
    assign(:monthly_fee, stub_model(MonthlyFee,
      :id => "MyString",
      :amount => "MyString",
      :due_date => "MyString",
      :pupil => pupil
    ).as_new_record)
    assign(:pupil, pupil)
  end

  it "renders new monthly_fee form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", pupil_monthly_fees_path(pupil), "post" do
      assert_select "input#monthly_fee_amount[name=?]", "monthly_fee[amount]"
      assert_select "select#monthly_fee_due_date_3i[name=?]", "monthly_fee[due_date(3i)]"
      assert_select "select#monthly_fee_due_date_2i[name=?]", "monthly_fee[due_date(2i)]"
      assert_select "select#monthly_fee_due_date_1i[name=?]", "monthly_fee[due_date(1i)]"
    end
  end
end
