FactoryGirl.define do
  factory :pupil do
    first_name "Anakin"
    last_name  "Skywalker"
    sequence :email do |n|
      "#{first_name}.#{last_name}#{n}@example.com".downcase
    end
    password '12345678'
    password_confirmation '12345678'
    birth 18.years.ago
    observations 'Lorem ipsum dolor'
  end
end
