FactoryGirl.define do
  sequence(:email) {|n| "user#{n}@example.com"}
  
  factory :user do 
    email 
    password "3254234234"
    first_name "Peter"
    last_name "Example"
    admin false
  end

  factory :admin, parent: :user do
    id
    admin true
  end
end