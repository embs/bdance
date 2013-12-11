require 'spec_helper'

describe HoursPackage do
  # Atributos
  it { should respond_to(:amount) }
  it { should respond_to(:weekly_hours) }

  # Associações
  it { should belong_to(:teacher) }
  it { should belong_to(:pupil) }
end
