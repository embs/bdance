require 'spec_helper'

describe "events/show" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :name => "Name",
      :description => "Description",
      :local => "Local",
      :date => "Date",
      :users => []
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Local/)
    expect(rendered).to match(/Date/)
    expect(rendered).to match(/Users/)
  end
end
