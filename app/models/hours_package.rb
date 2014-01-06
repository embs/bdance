class HoursPackage < ActiveRecord::Base
  belongs_to :teacher
  has_and_belongs_to_many :pupils
  accepts_nested_attributes_for :pupils, reject_if: lambda { |h| h[:pupil].blank? },
    allow_destroy: true
  has_many :horaries, dependent: :destroy
  accepts_nested_attributes_for :horaries, reject_if: lambda { |h| h[:day].blank? },
    allow_destroy: true
end
