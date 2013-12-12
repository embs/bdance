require 'spec_helper'

describe "modalities/edit" do
  before(:each) do
    @modality = assign(:modality, stub_model(Modality,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit modality form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", modality_path(@modality), "post" do
      assert_select "input#modality_name[name=?]", "modality[name]"
      assert_select "input#modality_description[name=?]", "modality[description]"
    end
  end
end
