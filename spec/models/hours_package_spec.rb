require 'spec_helper'

describe HoursPackage do
  # Associações
  it { should belong_to(:teacher) }
  it { should have_and_belong_to_many(:pupils) }
  it { should have_many(:horaries) }
end
