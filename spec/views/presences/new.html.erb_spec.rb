require 'spec_helper'

describe "presences/new" do
  before(:each) do
    @user = stub_model(User)
    @presence = assign(:presence,
      stub_model(Presence, user: @user, time: "MyString" ).as_new_record)

    render
  end

  it "renders new presence form" do
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_presences_path(@user), "post" do
      assert_select "select#presence_user[name=?]", "presence[user]"
      assert_select "select#presence_time_1i[name=?]", "presence[time(1i)]"
      assert_select "select#presence_time_2i[name=?]", "presence[time(2i)]"
      assert_select "select#presence_time_3i[name=?]", "presence[time(3i)]"
    end
  end

  it "renders back link" do
    assert_select "a[href=#{user_presences_path(@user)}]"
  end
end
