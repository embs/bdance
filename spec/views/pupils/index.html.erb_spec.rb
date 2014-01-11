require 'spec_helper'

describe "pupils/index" do
  before(:each) do
    assign(:pupils, [
      stub_model(Pupil,
        :first_name => "First Name",
        :last_name => "Last Name",
        :username => "Username",
        :email => "Mail",
        :rg => "Rg",
        :cpf => "Cpf",
        :birth => Date.new,
        :phone => "Phone",
        :profession => "Profession",
        :observations => "Observations"
      ),
      stub_model(Pupil,
        :first_name => "First Name",
        :last_name => "Last Name",
        :username => "Username",
        :email => "Mail",
        :rg => "Rg",
        :cpf => "Cpf",
        :birth => Date.new,
        :phone => "Phone",
        :profession => "Profession",
        :observations => "Observations"
      )
    ])
  end

  it "renders a list of pupils" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Mail".to_s, :count => 2
    assert_select "tr>td", :text => "Rg".to_s, :count => 2
    assert_select "tr>td", :text => "Cpf".to_s, :count => 2
    assert_select "tr>td", :text => Date.new.to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Profession".to_s, :count => 2
    assert_select "tr>td", :text => "Observations".to_s, :count => 2
  end
end
