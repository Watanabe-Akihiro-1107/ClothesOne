require 'rails_helper'

RSpec.describe Item, type: :model do
  # describe：Userモデルをテスト対象にすることを示している。
  context "データが正しく保存される" do
  # データが正しく保存できることに関するテストであることを示している。
    before do
    # "before"はテスト前のデータを生成している
    FactoryBot.create(:item)
    @item.save
    end
    it "全て入力してあるので保存される" do
      expect(@user).to be_valid
      # expect(@user).to：saveされているデータが入っている変数を示している。
      # be_valid：@userに正しくデータが保存されているかを確認する。
    end
  end
  context "データが正しく保存されない" do
    before do
      @item =Item.new
      @item.user_id = 1
      @item.item_name = "コンフォートシャツ"
      @item.introduction = "オープンカラーでとても綺麗めです"
      @item.brand_name =""
      @item.category_id = 13
      @item.save
    end
    it "brand_nameが入力されていないので保存されない" do
      expect(@item).to be_invalid
      expect(@item.errors[:brand_name]).to include("は1文字以上に設定して下さい。")
    end
  end
end