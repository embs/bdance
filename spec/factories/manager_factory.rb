FactoryGirl.define do
  factory :manager do
    first_name "Dilberts"
    last_name  "Manager"
    sequence :email do |n|
      "#{first_name}.#{last_name}#{n}@example.com".downcase
    end
    password '12345678'
    birth 40.years.ago
    responsibility 'Manager'
    wage 1200

    after(:create) do |manager|
      manager.roles << Role.find_by_name('manager')
    end
  end
end
