require 'spec_helper'

describe Presence do
  # Atributos
  it { should respond_to :user }
  it { should respond_to :time }

  # Associações
  it { should belong_to :user }

  # Validações
  it { should validate_presence_of :user }
  it { should validate_presence_of :time }
end
