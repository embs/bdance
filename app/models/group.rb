class Group < ActiveRecord::Base
  has_many :enrollments
  has_many :pupils, through: :enrollments
  belongs_to :modality
  belongs_to :teacher
  has_many :horaries, dependent: :destroy
  accepts_nested_attributes_for :horaries, reject_if: lambda { |h| h[:day].blank? },
    allow_destroy: true
  validates_presence_of :name, :modality
end
