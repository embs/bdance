# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    name "New Group"
    description "A brand new group."
    modality { FactoryGirl.create(:modality) }
    start_date Time.now
    end_date 1.year.from_now
    price 120.00
  end
end
