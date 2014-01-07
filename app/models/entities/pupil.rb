class Pupil < ActiveRecord::Base
  acts_as :user
  has_many :responsibilities
  has_many :responsibles, through: :responsibilities
  has_many :enrollments
  has_many :groups, through: :enrollments
  has_many :monthly_fees
  has_many :payments
  has_and_belongs_to_many :hours_packages
end
