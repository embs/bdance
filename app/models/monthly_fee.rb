class MonthlyFee < ActiveRecord::Base
  belongs_to :pupil
  has_one :payment

  validates_presence_of :pupil, :amount, :due_date
end
