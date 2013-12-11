require 'spec_helper'

describe Responsible do
  # Herança
  specify { Responsible.should be < User }

  # Associações
  it { should have_many(:pupils).through(:responsibilities) }
end
