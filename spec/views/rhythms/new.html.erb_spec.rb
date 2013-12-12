require 'spec_helper'

describe "rhythms/new" do
  let(:modality) { Modality.create(name: "MyModality") }

  before(:each) do
    assign(:rhythm, stub_model(Rhythm,
      :name => "MyString",
      :description => "MyText",
      :modality => modality
    ).as_new_record)
  end

  it "renders new rhythm form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", rhythms_path, "post" do
      assert_select "input#rhythm_name[name=?]", "rhythm[name]"
      assert_select "textarea#rhythm_description[name=?]", "rhythm[description]"
      assert_select "select#rhythm_modality[name=?]", "rhythm[modality]"
    end
  end
end
