# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :phone_number do
    ddd 1
    number 1
    provider "MyString"
  end
end
