class Pupil < User
  self.table_name = "pupils"
  has_many :responsibilities
  has_many :responsibles, through: :responsibilities
  has_one :hours_package
  has_many :enrollments
  has_many :groups, through: :enrollments
  has_many :monthly_fees
  has_many :payments
end
