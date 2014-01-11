require 'spec_helper'

describe Event do
  it { should respond_to :name }
  it { should respond_to :description }
  it { should respond_to :local }
  it { should respond_to :date }

  it { should have_and_belong_to_many :users }
end
