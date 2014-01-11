require 'spec_helper'

describe Pupil do
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

  # Associações
  it { should have_many(:responsibles).through(:responsibilities) }
  it { should have_many(:groups).through(:enrollments) }
  it { should have_many(:monthly_fees) }
  it { should have_many(:payments) }
  it { should have_many(:hours_packages).through(:private_classes) }
end
