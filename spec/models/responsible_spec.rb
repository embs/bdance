require 'spec_helper'

describe Responsible do
  # Atributos de User
  it { should respond_to(:rg) }
  it { should respond_to(:cpf) }
  it { should respond_to(:profession) }
  it { should respond_to(:birth) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:username) }

  # Associação
  it { should have_many(:pupils).through(:responsibilities) }
end
