require 'spec_helper'

describe Pupil do
  # Herança
  specify { Pupil.should be < User }

  # Associações
  it { should have_many(:responsibles).through(:responsibilities) }
  it { should have_one(:hours_package) }
  it { should have_many(:groups).through(:enrollments) }
  it { should have_many(:monthly_fees) }
  it { should have_many(:payments) }
end
