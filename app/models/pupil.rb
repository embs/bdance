class Pupil < ActiveRecord::Base
  acts_as :user
  has_many :responsibilities, dependent: :destroy
  has_many :responsibles, through: :responsibilities
  has_many :enrollments
  has_many :groups, through: :enrollments
  has_many :monthly_fees
  has_many :payments
  has_many :private_classes
  has_many :hours_packages, through: :private_classes
  accepts_nested_attributes_for :responsibilities, reject_if: lambda { |h| h[:responsible].blank? },
    allow_destroy: true
end
