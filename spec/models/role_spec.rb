require 'spec_helper'

describe Role do
  it { should respond_to :name }
  it { should have_many :assignments }
  it { should have_many(:users).through(:assignments) }
end
