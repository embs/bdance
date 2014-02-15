require 'spec_helper'

describe MonthlyFee do
  # Associações
  it { should belong_to(:pupil) }
  it { should have_one(:payment) }

  # Validações
  it { should validate_presence_of(:pupil) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:due_date) }
end
