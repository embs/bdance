# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rhythm do
    name "New Rhythm"
    description "A new brand rhythm."
    modality { FactoryGirl.create :modality }
  end
end
