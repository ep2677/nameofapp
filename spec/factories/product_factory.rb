FactoryGirl.define do
  sequence(:id) { |n| "#{n}" }

  factory :product do
    id
    name "anything"
    description "anything"
    price 120
    colour "blue"
  end

end