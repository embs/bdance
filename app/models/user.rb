class User < ActiveRecord::Base
  has_and_belongs_to_many :events
  has_many :presences
  has_one :address
end
