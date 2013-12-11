class Group < ActiveRecord::Base
  has_many :enrollments
  has_many :pupils, through: :enrollments
  belongs_to :modality
end
