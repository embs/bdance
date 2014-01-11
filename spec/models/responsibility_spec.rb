require 'spec_helper'

describe Responsibility do
  it { should respond_to :kinship }

  it { should belong_to :responsible }
  it { should belong_to :pupil }
end
