# This will guess the User class
FactoryGirl.define do
  factory :user do
    first_name "Anakin"
    last_name  "Skywalker"
    sequence :email do |n|
      "#{first_name}.#{last_name}#{n}@example.com".downcase
    end
    password '12345678'
    birth 20.years.ago

    after(:create) do |user|
      user.roles << Role.find_by_name('user')
    end
  end

  # This will use the User class (Admin would have been guessed)
  # factory :admin, class: User do
  #   first_name "Admin"
  #   last_name  "User"
  #   admin      true
  # end
end
