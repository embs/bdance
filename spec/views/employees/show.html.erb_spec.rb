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
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Sobrenome/)
    expect(rendered).to match(/Nome de Usuário/)
    expect(rendered).to match(/E-mail/)
    expect(rendered).to match(/RG/)
    expect(rendered).to match(/CPF/)
    expect(rendered).to match(/Data de Nascimento/)
    expect(rendered).to match(/Telefones/)
    expect(rendered).to match(/Cargo/)
    expect(rendered).to match(/Salário/)
  end
end
