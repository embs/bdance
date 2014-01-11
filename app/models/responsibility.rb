class Responsibility < ActiveRecord::Base
  belongs_to :responsible
  belongs_to :pupil
end
