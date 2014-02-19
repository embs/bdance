require 'spec_helper'

describe "presences/users_index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        id: 1,
        first_name: "John",
        last_name: "Snow"
      ),
      stub_model(User,
        id: 2,
        first_name: "Ned",
        last_name: "Stark"
      )
    ])

    render
  end

  it "renders table header" do
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>th", text: Presence.human_attribute_name(:id), count: 1
    assert_select "tr>th", text: Presence.human_attribute_name(:user), count: 1
  end

  it "renders John Snow info" do
    assert_select "tr>td", text: "1", count: 1
    assert_select "tr>td", text: "John Snow", count: 1
  end

  it "renders Ned Stark info" do
    assert_select "tr>td", text: "2", count: 1
    assert_select "tr>td", text: "Ned Stark", count: 1
  end

  it "renders show presences link" do
    assert_select "tr>td>a", text: "#{t('action.show')} #{Presence.model_name.human.pluralize}", count: 2
  end
end
