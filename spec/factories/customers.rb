FactoryGirl.define do
  factory :customer do
    trait :one do
      Phone "1112223333"
      LastName "Smith"
      FirstName "Jim"
      created_at { DateTime.now }
    end
    trait :two do
      Phone "4445556666"
      LastName "Brown"
      FirstName "Bob"
      created_at { DateTime.now }
    end
  end
end