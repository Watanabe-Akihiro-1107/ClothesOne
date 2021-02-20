require 'rails_helper'

RSpec.describe Item, type: :model do
    describe "正しく保存される" do
      before do
        @item = FactoryBot.create(:item)
      end
      it "全てのカラムに値が入っているので正しく保存される" do
      expect(@item).to be_valid
      end
    end

    describe "バリデーションのチェック" do
      let(:item) { build(:item) }
      subject{ test_item.valid? }

      context "item_nameカラムのチェック" do
        let(:test_item) { item }
        it "空欄でないこと" do
          test_item.item_name = ""
          is_expected.to eq false
        end
      end

      context "introductionカラムのチェック" do
        let(:test_item) { item }
        it "空欄でないこと" do
          test_item.introduction = ""
          is_expected.to eq false
        end

        it "200文字以内であること" do
          test_item.introduction = Faker::Lorem.characters(number:201)
          is_expected.to eq false
        end
      end

      context "brand_nameカラムのチェック" do
      let(:test_item) { item }
        it "空欄でないこと" do
          test_item.brand_name = ""
          is_expected.to eq false
        end
        it "20文字以内であること" do
          test_item.brand_name = Faker::Lorem.characters(number:21)
          is_expected.to eq false
        end
      end
    end

    describe "アソシエーションのチェック" do
      context "Userモデルとの関係" do
        it "1:Nになっている" do
          expect(Item.reflect_on_association(:user).macro).to eq :belongs_to
        end
      end
      context "Categoryモデルとの関係" do
        it "1:Nになっている" do
          expect(Item.reflect_on_association(:category).macro).to eq :belongs_to
        end
      end
     end
end