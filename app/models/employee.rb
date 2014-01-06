class Employee < ActiveRecord::Base
  acts_as_superclass
  acts_as :user
end
