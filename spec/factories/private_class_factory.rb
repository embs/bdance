# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :private_class do
    pupil { FactoryGirl.create :pupil }
    hours_package { FactoryGirl.create :hours_package }
  end
end
