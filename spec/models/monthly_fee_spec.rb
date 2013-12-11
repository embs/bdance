require 'spec_helper'

describe MonthlyFee do
  it { should belong_to(:pupil) }
  it { should have_one(:payment) }
end
