# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attendance do
    user { FactoryGirl.create(:user) }
    event { FactoryGirl.create(:event) }
  end
end
