require 'spec_helper'

describe "employees/show" do
  before(:each) do
    @employee = assign(:employee, stub_model(Employee,
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Mail",
      :username => "Username",
      :rg => "Rg",
      :cpf => "Cpf",
      :birth => "Birth",
      :phone => "Phone",
      :responsibility => "Responsibility",
      :wage => "Wage"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Mail/)
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Rg/)
    expect(rendered).to match(/Cpf/)
    expect(rendered).to match(/Birth/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Responsibility/)
    expect(rendered).to match(/Wage/)
  end
end
