require 'spec_helper'

describe Modality do
  it { should have_many(:groups) }
  it { should have_many(:rhythms) }
end
