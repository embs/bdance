require 'spec_helper'

describe HoursPackage do
  # Associações
  it { should belong_to(:teacher) }
  it { should have_many(:pupils).through(:private_classes) }
  it { should have_many(:horaries) }

  # Validações
  it { should validate_presence_of(:teacher) }
end
