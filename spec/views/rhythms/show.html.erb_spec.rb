require 'spec_helper'

describe "rhythms/show" do
  let(:modality) { Modality.create(name: "MyModality") }

  before(:each) do
    @rhythm = assign(:rhythm, stub_model(Rhythm,
      :name => "Name",
      :description => "MyText",
      :modality => modality
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
