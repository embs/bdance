require 'spec_helper'

describe Event do
  # Atributos
  it { should respond_to :name }
  it { should respond_to :description }
  it { should respond_to :local }
  it { should respond_to :date }

  # Associações
  it { should have_many(:users).through(:attendances) }

  # Validações
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
end
