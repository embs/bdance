require 'spec_helper'

describe PhoneNumber do
  it { should respond_to :kind }
  it { should respond_to :ddd }
  it { should respond_to :number }
  it { should respond_to :provider }
  it { should belong_to :user }
end
