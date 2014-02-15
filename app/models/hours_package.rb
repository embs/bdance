class HoursPackage < ActiveRecord::Base
  belongs_to :teacher
  has_many :private_classes
  has_many :pupils, through: :private_classes
  accepts_nested_attributes_for :private_classes, reject_if: lambda { |h| h[:pupil].blank? },
    allow_destroy: true
  has_many :horaries, dependent: :destroy
  accepts_nested_attributes_for :horaries, reject_if: lambda { |h| h[:day].blank? },
    allow_destroy: true

  validates_presence_of :teacher
end
