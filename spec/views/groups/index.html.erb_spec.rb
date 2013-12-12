require 'spec_helper'

describe "groups/index" do
  let(:modality) { Modality.create(name: "MyModality") }

  before(:each) do
    assign(:groups, [
      stub_model(Group,
        :name => "Name",
        :description => "MyText",
        :price => 1.5,
        :hour => "456",
        :local => "Local",
        :modality => modality
      ),
      stub_model(Group,
        :name => "Name",
        :description => "MyText",
        :price => 1.5,
        :hour => "456",
        :local => "Local",
        :modality => modality
      )
    ])
  end

  xit "renders a list of groups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "456".to_s, :count => 2
    assert_select "tr>td", :text => "Local".to_s, :count => 2
    assert_select "tr>td", :text => "MyModality", :count => 2
  end
end
