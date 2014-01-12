require 'spec_helper'

describe "events/index" do
  before(:each) do
    assign(:events, [
      stub_model(Event,
        :name => "MyEvent",
        :description => "Description",
        :local => "Toca",
        :date => Time.now,
        :users => [stub_model(User, email: "john@example.com"),
          stub_model(User, email: "anakin@example.com")]
      ),
      stub_model(Event,
        :name => "MyOtherEvent",
        :description => "Description",
        :local => "Toca",
        :date => Time.now,
        :users => [stub_model(User, email: "john@example.com"),
          stub_model(User, email: "anakin@example.com")]
      )
    ])
  end

  it "renders a list of events" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyEvent".to_s, :count => 1
    assert_select "tr>td", :text => "MyOtherEvent".to_s, :count => 1
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Toca".to_s, :count => 2
  end
end
