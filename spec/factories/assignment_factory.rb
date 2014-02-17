# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assignment do
    user { FactoryGirl.create :user }
    role { FactoryGirl.create :role }
  end
end
