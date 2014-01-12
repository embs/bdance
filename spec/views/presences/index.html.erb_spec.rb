require 'spec_helper'

describe "presences/index" do
  before(:each) do
    assign(:presences, [
      stub_model(Presence,
        :user => stub_model(User, first_name: 'John'),
        :time => Date.new
      ),
      stub_model(Presence,
        :user => stub_model(User, first_name: 'Tiberius'),
        :time => Date.new
      )
    ])
  end

  it "renders a list of presences" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "John".to_s, :count => 1
    assert_select "tr>td", :text => "Tiberius".to_s, :count => 1
  end
end
