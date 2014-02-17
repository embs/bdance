FactoryGirl.define do
  factory :enrollment do
    sequence :number
    date Time.now
    pupil { FactoryGirl.create(:pupil) }
    group { FactoryGirl.create(:group) }
  end
end
