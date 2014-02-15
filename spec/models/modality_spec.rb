require 'spec_helper'

describe Modality do
  # Associações
  it { should have_many(:groups) }
  it { should have_many(:rhythms) }

  # Validações
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
end
