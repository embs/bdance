# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    name "New Group"
    description "A brand new group."
    modality { FactoryGirl.create(:modality) }
  end
end
