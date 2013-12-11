require 'spec_helper'

describe Teacher do
  it { should have_many(:hours_packages) }
end
