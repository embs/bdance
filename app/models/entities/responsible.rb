class Responsible < ActiveRecord::Base
  acts_as :user
  has_many :responsibilities
  has_many :pupils, through: :responsibilities
end
