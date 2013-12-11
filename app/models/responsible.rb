class Responsible < User
  self.table_name = "responsibles"
  has_many :responsibilities
  has_many :pupils, through: :responsibilities
end
