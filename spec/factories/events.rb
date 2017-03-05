FactoryGirl.define do
  factory :event do
    name "Event Name"
    starts_at { Time.now }
    trait :upcoming do
      starts_at { 1.day.from_now }
    end

    trait :outdated do
      starts_at { 1.day.ago }
    end
  end
end
