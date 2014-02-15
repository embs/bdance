require 'spec_helper'

describe Rhythm do
  # Associações
  it { should belong_to(:modality) }

  # Validações
  it { should validate_presence_of(:modality) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
end
