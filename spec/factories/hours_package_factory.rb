# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :hours_package do
    teacher { FactoryGirl.create(:teacher) }
  end
end
