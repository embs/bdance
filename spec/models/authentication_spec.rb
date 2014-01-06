require 'spec_helper'

describe Authentication do
  it { should respond_to(:provider, :token, :uid, :user_id)}
  it { should belong_to :user }
  it { should validate_presence_of(:provider)}
  it { should validate_presence_of(:uid)}
end
