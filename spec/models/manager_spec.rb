require 'spec_helper'

describe Manager do
  # Atributos de User
  it { should respond_to(:rg) }
  it { should respond_to(:cpf) }
  it { should respond_to(:profession) }
  it { should respond_to(:birth) }
  it { should respond_to(:phone) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:username) }

  # Atributos de Employee
  it { should respond_to(:responsibility) }
  it { should respond_to(:wage) }
end
