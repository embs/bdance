# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :presence do
    user { FactoryGirl.create(:user) }
    time Time.now
  end
end
