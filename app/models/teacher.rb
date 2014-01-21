class Teacher < ActiveRecord::Base
  acts_as :employee
  has_many :hours_packages
  has_many :groups
end
