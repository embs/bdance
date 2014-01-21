require 'spec_helper'

describe Teacher do
  # Atributos de User
  it { should respond_to(:rg) }
  it { should respond_to(:cpf) }
  it { should respond_to(:profession) }
  it { should respond_to(:birth) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:username) }

  # Atributos de Employee
  it { should respond_to(:responsibility) }
  it { should respond_to(:wage) }

  # Associações
  it { should have_many(:hours_packages) }
  it { should have_many(:groups) }
end
