require 'spec_helper'

describe Rhythm do
  it { should belong_to(:modality) }
  it { should validate_presence_of(:modality) }
end
