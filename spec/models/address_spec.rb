require 'spec_helper'

describe Address do
  it { should respond_to :user }
  it { should respond_to :street }
  it { should respond_to :number }
  it { should respond_to :district }
  it { should respond_to :city }
  it { should respond_to :state }
  it { should respond_to :zip_code }
end
