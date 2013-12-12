require 'spec_helper'

describe "modalities/new" do
  before(:each) do
    assign(:modality, stub_model(Modality,
      :name => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new modality form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", modalities_path, "post" do
      assert_select "input#modality_name[name=?]", "modality[name]"
      assert_select "input#modality_description[name=?]", "modality[description]"
    end
  end
end
