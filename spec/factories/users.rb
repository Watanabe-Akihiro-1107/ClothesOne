FactoryBot.define do
  factory :user do
  	nickname { Faker::Lorem.characters(number:10) }
  	email { Faker::Internet.email }
  	password {"test1234"}
  end
end