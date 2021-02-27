FactoryBot.define do
	factory :notification do
		visitor_id = Faker::Lorem.characters(number:1)
		visited_id = Faker::Lorem.characters(number:1)
	end
end