require 'rails_helper'

RSpec.describe "Items", type: :request do
  describe '新規投稿ページ' do
    context "新規投稿ページが正しく表示される" do
      before do
        get new_item_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("新規投稿")
      end


      context "投稿機能のテスト" do
        before do
          @user = FactoryBot.build(:user)
          @user.id = 1
        end
        it "新規投稿できる" do
          visit root_path
          visit new_item_path

          fill_in "アイテム名", with: "テスト"
          fill_in "詳細", with: "テスト"
          fill_in "item[brand_name]", with:"ユニクロ"
          attach_file "item_image", "app/assets/images/no_image.jpg"
          click_on 'アイテムを投稿'
          expect(page).to have_content 'しました'
        end
      end
    end
  end
end