require 'spec_helper'

describe "groups/edit" do
  before(:each) do
    @group = assign(:group, stub_model(Group,
      :name => "MyString",
      :description => "MyText",
      :price => 1.5,
      :time => "",
      :local => "MyString",
      :modality => nil
    ))
  end

  it "renders the edit group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", group_path(@group), "post" do
      assert_select "input#group_name[name=?]", "group[name]"
      assert_select "textarea#group_description[name=?]", "group[description]"
      assert_select "input#group_price[name=?]", "group[price]"
      # assert_select "select#group_horary[name=?]", "group[horary]"
      assert_select "input#group_local[name=?]", "group[local]"
      assert_select "select#group_modality[name=?]", "group[modality]"
    end
  end
end
