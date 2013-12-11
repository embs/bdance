class HoursPackage < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :pupil
end
