require 'spec_helper'

describe Employee do
  # Atributos de User
  it { should respond_to(:rg) }
  it { should respond_to(:cpf) }
  it { should respond_to(:profession) }
  it { should respond_to(:birth) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:username) }

  # Atributos
  it { should respond_to(:responsibility) }
  it { should respond_to(:wage) }

  # Validações
  it { should validate_presence_of(:responsibility) }
  it { should validate_presence_of(:wage) }
end
