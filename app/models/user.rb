class User < ActiveRecord::Base
  acts_as_superclass
  has_and_belongs_to_many :events
  has_many :presences
  has_one :address
  # composed_of :birth,
  #             :class_name => 'Date',
  #             :mapping => %w(Date to_s),
  #             :constructor => Proc.new { |date| (date && date.to_date) || Date.today },
  #             :converter => Proc.new { |value| value.to_s.to_date }
end
