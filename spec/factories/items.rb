FactoryBot.define do
  factory :item do
  	item_name { Faker::Lorem.characters(number:10) }
  	introduction { Faker::Lorem.characters(number:20) }
  	brand_name { Faker::Lorem.characters(number:5) }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }

    association :user
    association :category
  end
end