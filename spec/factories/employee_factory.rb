FactoryGirl.define do
  factory :employee do
    first_name "Anakin"
    last_name  "Skywalker"
    sequence :email do |n|
      "#{first_name}.#{last_name}#{n}@example.com".downcase
    end
    password '12345678'
    responsibility 'Jedi'
    wage 120.0
  end
end
