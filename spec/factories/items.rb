FactoryBot.define do
  factory :item do
  	@item =Item.new
  	@item.user_id = 1
  	@item.item_name = "コンフォートシャツ"
  	@item.introduction = "オープンカラーでとても綺麗めです"
  	@item.brand_name ="ユニクロ"
  	@item.category_id = 13
  end
end