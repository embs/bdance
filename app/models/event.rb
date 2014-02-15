class Event < ActiveRecord::Base
  has_many :attendances
  has_many :users, through: :attendances
  accepts_nested_attributes_for :attendances, reject_if: lambda { |h| h[:user].blank? },
    allow_destroy: true
  validates_presence_of :name, :description
end
