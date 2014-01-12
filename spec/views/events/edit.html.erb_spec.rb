require 'spec_helper'

describe "events/edit" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :name => "MyString",
      :description => "MyString",
      :local => "MyString",
      :date => "MyString",
      :hour => "MyString",
      :users => []
    ))
  end

  it "renders the edit event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", event_path(@event), "post" do
      assert_select "input#event_name[name=?]", "event[name]"
      assert_select "textarea#event_description[name=?]", "event[description]"
      assert_select "input#event_local[name=?]", "event[local]"
      assert_select "select#event_date_1i[name=?]", "event[date(1i)]"
      assert_select "select#event_date_2i[name=?]", "event[date(2i)]"
      assert_select "select#event_date_3i[name=?]", "event[date(3i)]"
      assert_select "select#event_date_4i[name=?]", "event[date(4i)]"
      assert_select "select#event_date_5i[name=?]", "event[date(5i)]"
      assert_select "a.add_nested_fields"
    end
  end
end
