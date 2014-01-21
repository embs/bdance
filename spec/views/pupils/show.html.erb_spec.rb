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
      :phone => "Telefones",
      :profession => "Profession",
      :observations => "Observations"
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
    expect(rendered).to match(/Profissão/)
    expect(rendered).to match(/Observações/)
  end
end
