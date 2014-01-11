require 'spec_helper'

describe PrivateClass do
  it { should belong_to :pupil }
  it { should belong_to :hours_package }
end
