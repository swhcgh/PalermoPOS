FactoryGirl.define do
  factory :product do
    
    trait :sub1 do
      id "1"
      Name "Plain Sub"
      Cost "5.99"
      category_id "2"
      created_at { DateTime.now }
      MinimumOptionCharge '0.5'
    end
    
    trait :plainpizza do
      id "2"
      Name "12 Inch Pizza"
      Cost "8.99"
      category_id "1"
      created_at { DateTime.now }
      MinimumOptionCharge '1.0'
    end
    
    free = ['7','8','9','10']
    trait :deluxepizza do
      id "3"
      Name "12 Inch Deluxe"
      freeoptions free
      Cost "12.99"
      category_id "1"
      created_at { DateTime.now }
      MinimumOptionCharge '1.0'
    end
    
    trait :cheesybread do
      id "4"
      Name "Cheesy Bread"
      Cost "6.99"
      category_id "1"
      created_at { DateTime.now }
      MinimumOptionCharge '1.0'
    end
      
    
    
  end
end