class Modality < ActiveRecord::Base
  has_many :groups
  has_many :rhythms
end
