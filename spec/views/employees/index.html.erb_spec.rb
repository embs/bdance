require 'spec_helper'

describe "employees/index" do
  before(:each) do
    assign(:employees, [
      stub_model(Employee,
        :first_name => "First Name",
        :last_name => "Last Name",
        :mail => "Mail",
        :username => "Username",
        :rg => "Rg",
        :cpf => "Cpf",
        :birth => Date.new,
        :phone => "Phone",
        :responsibility => "Responsibility",
        :wage => 120.0
      ),
      stub_model(Employee,
        :first_name => "First Name",
        :last_name => "Last Name",
        :mail => "Mail",
        :username => "Username",
        :rg => "Rg",
        :cpf => "Cpf",
        :birth => Date.new,
        :phone => "Phone",
        :responsibility => "Responsibility",
        :wage => 120.0
      )
    ])
  end

  it "renders a list of employees" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Mail".to_s, :count => 2
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Rg".to_s, :count => 2
    assert_select "tr>td", :text => "Cpf".to_s, :count => 2
    assert_select "tr>td", :text => Date.new.to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Responsibility".to_s, :count => 2
    assert_select "tr>td", :text => 120.0.to_s, :count => 2
  end
end
