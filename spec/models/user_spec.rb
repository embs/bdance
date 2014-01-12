require 'spec_helper'

describe User do
  # Atributos
  it { should respond_to(:rg) }
  it { should respond_to(:cpf) }
  it { should respond_to(:profession) }
  it { should respond_to(:birth) }
  it { should respond_to(:phone) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:username) }

  # Associações
  it { should have_many(:events).through(:attendances) }
  it { should have_many(:presences) }
  it { should have_one(:address) }
  it { should have_many(:authentications) }
end
