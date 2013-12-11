require 'spec_helper'

describe Payment do
  it { should belong_to(:monthly_fee) }
  it { should belong_to(:pupil)}
end
