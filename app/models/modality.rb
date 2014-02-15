class Modality < ActiveRecord::Base
  has_many :groups
  has_many :rhythms

  validates_presence_of :name, :description
end
