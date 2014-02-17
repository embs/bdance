FactoryGirl.define do
  factory :pupil do
    sequence :first_name do |n|
      "Anakin#{n}"
    end
    last_name  "Skywalker"
    sequence :email do |n|
      "#{first_name}.#{last_name}#{n}@example.com".delete(' ').downcase
    end
    password '12345678'
    password_confirmation '12345678'
    birth 18.years.ago
    observations 'Lorem ipsum dolor'

    after(:create) do |pupil|
      pupil.roles << Role.find_by_name('pupil')
    end

    factory :pupil_with_enrollment do
      after(:create) do |pupil|
        pupil.enrollments << FactoryGirl.create(:enrollment, pupil: pupil)
      end
    end
  end
end
