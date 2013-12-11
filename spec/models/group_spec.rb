require 'spec_helper'

describe Group do
  # Atributos
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:price) }
  it { should respond_to(:hour) }
  it { should respond_to(:local) }
  it { should respond_to(:start) }
  it { should respond_to(:end) }

  # Associações
  it { should have_many(:pupils).through(:enrollments) }
  it { should belong_to(:modality) }
end
