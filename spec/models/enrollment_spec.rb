require 'spec_helper'

describe Enrollment do
  it { should belong_to(:pupil) }
  it { should belong_to(:group) }
end
