# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :monthly_fee do
    amount 120
    due_date Time.now
    pupil { FactoryGirl.create :pupil }
  end
end
