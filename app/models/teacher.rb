class Teacher < ActiveRecord::Base
  acts_as :employee
  has_many :hours_packages
  has_and_belongs_to_many :groups
end
