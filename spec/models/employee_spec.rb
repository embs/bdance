require 'spec_helper'

describe Employee do
  # Herança
  specify { Employee.should be < User }

  # Atributos
  it { should respond_to(:responsibility) }
  it { should respond_to(:wage) }
end
