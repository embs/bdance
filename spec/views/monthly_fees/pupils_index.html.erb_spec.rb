require 'spec_helper'

describe "monthly_fees/pupils_index" do
  before(:each) do
    @pupils = assign(:pupils, [
      stub_model(Pupil,
        id: 1,
        first_name: 'Homer',
        last_name: 'Simpson'
      ),
      stub_model(Pupil,
        id: 2,
        first_name: 'Anakyn',
        last_name: 'Skywalker'
      )
    ])
  end

  it "renders a list of monthly_fees" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    @pupils.each do |pupil|
      assert_select "tr>td", text: pupil.id.to_s, count: 1
      assert_select "tr>td", text: "#{pupil.first_name} #{pupil.last_name}", count: 1
    end
    assert_select "tr>td>a", text: "#{t('action.show')} #{MonthlyFee.model_name.human.pluralize}", count: 2
  end
end
