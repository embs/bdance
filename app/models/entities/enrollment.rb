class Enrollment < ActiveRecord::Base
  belongs_to :pupil
  belongs_to :group
end
