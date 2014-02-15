class Payment < ActiveRecord::Base
  belongs_to :monthly_fee
  belongs_to :pupil

  validates_presence_of :pupil, :monthly_fee, :date
end
