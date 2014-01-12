require 'spec_helper'

describe "presences/new" do
  before(:each) do
    assign(:presence, stub_model(Presence,
      :user => stub_model(User),
      :time => "MyString"
    ).as_new_record)
  end

  it "renders new presence form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", presences_path, "post" do
      assert_select "select#presence_user[name=?]", "presence[user]"
      assert_select "select#presence_time_1i[name=?]", "presence[time(1i)]"
      assert_select "select#presence_time_2i[name=?]", "presence[time(2i)]"
      assert_select "select#presence_time_3i[name=?]", "presence[time(3i)]"
    end
  end
end
