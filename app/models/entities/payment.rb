class Payment < ActiveRecord::Base
  belongs_to :monthly_fee
  belongs_to :pupil
end
