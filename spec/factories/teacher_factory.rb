FactoryGirl.define do
  factory :teacher do
    first_name "Dancer"
    last_name  "Vader"
    sequence :email do |n|
      "#{first_name}.#{last_name}#{n}@example.com".downcase
    end
    password '12345678'
    wage 1200
    responsibility 'Teacher'
    birth 30.year.ago

    after(:create) do |teacher, evaluator|
      teacher.roles << Role.find_by_name('teacher')
      create_list(:phone_number, 2, user: teacher.user)
    end
  end
end
