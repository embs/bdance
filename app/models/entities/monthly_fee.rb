class MonthlyFee < ActiveRecord::Base
  belongs_to :pupil
  has_one :payment
end
