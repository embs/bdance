require 'spec_helper'

describe Presence do
  it { should respond_to :user }
  it { should respond_to :time }
end
