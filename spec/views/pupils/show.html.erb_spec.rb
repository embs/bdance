require 'spec_helper'

describe "pupils/show" do
  before(:each) do
    @pupil = assign(:pupil, stub_model(Pupil,
      :first_name => "First Name",
      :last_name => "Last Name",
      :username => "Username",
      :email => "Mail",
      :rg => "Rg",
      :cpf => "Cpf",
      :birth => "Birth",
      :phone => "Phone",
      :profession => "Profession",
      :observations => "Observations"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Mail/)
    expect(rendered).to match(/Rg/)
    expect(rendered).to match(/Cpf/)
    expect(rendered).to match(/Birth/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Profession/)
    expect(rendered).to match(/Observations/)
  end
end
