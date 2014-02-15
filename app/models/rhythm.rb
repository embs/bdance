class Rhythm < ActiveRecord::Base
  belongs_to :modality
  validates_presence_of :modality, :name, :description
end
