FactoryBot.define do
  factory :item do
  	item_name {"コンフォートシャツ"}
  	introduction {"オープンカラーでとても綺麗めです"}
  	brand_name {"ユニクロ"}
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }

    association :user
    association :category
  end
end