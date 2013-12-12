require 'spec_helper'

describe "groups/new" do
  before(:each) do
    assign(:group, stub_model(Group,
      :name => "MyString",
      :description => "MyText",
      :price => 1.5,
      :hour => "",
      :local => "MyString",
      :modality => nil
    ).as_new_record)
  end

  it "renders new group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", groups_path, "post" do
      assert_select "input#group_name[name=?]", "group[name]"
      assert_select "textarea#group_description[name=?]", "group[description]"
      assert_select "input#group_price[name=?]", "group[price]"
      assert_select "input#group_hour[name=?]", "group[hour]"
      assert_select "input#group_local[name=?]", "group[local]"
      assert_select "select#group_modality[name=?]", "group[modality]"
    end
  end
end
