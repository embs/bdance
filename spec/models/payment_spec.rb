require 'spec_helper'

describe Payment do
  # Associações
  it { should belong_to(:monthly_fee) }
  it { should belong_to(:pupil)}

  # Validações
  it { should validate_presence_of(:pupil) }
  it { should validate_presence_of(:monthly_fee) }
  it { should validate_presence_of(:date) }
end
