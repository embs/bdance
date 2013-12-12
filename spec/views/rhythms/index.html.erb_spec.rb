require 'spec_helper'

describe "rhythms/index" do
  let(:modality) { Modality.create(name: "MyModality") }

  before(:each) do
    assign(:rhythms, [
      stub_model(Rhythm,
        :name => "Name",
        :description => "MyText",
        :modality => modality
      ),
      stub_model(Rhythm,
        :name => "Name",
        :description => "MyText",
        :modality => modality
      )
    ])
  end

  it "renders a list of rhythms" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyModality".to_s, :count => 2
  end
end
