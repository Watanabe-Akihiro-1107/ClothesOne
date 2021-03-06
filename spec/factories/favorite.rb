FactoryBot.define do
  factory :favorte do
  	user_id { Faker::Number.digit}
  	item_id { Faker::Number.digit}

    association :user
    association :item
  end
end