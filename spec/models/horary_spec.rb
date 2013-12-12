require 'spec_helper'

describe Horary do
  # Atributos
  it { should respond_to(:day) }
  it { should respond_to(:start) }
  it { should respond_to(:end) }

  # Associações
  it { should belong_to(:group) }
end
