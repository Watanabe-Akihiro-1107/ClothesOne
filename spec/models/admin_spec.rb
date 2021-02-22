require "rails_helper"
RSpec.describe Admin ,type: :model do
	context "正しく保存される" do
		before do
			@admin = FactoryBot.create(:admin)
		end
		it "全て入力されているので正しく保存される" do
			expect(@admin).to be_valid
		end
 	end

 	describe "バリデーションのテスト" do
 	let (:admin) {build(:admin)}
 	subject{ admin.valid? }
	 	context "パスワードカラムのテスト" do
	 		it "6文字以上であること" do
	 			admin.password = Faker::Lorem.characters(number:5)
	 			is_expected.to eq false
	 		end
	 		it "空欄でないこと" do
	 			admin.password = ""
	 			is_expected.to be false
	 		end
	 	end
	 	context "emailカラムのテスト" do
	 	before do
	 		@admin = FactoryBot.build(:admin)
	 	end
	 		it "空欄でないこと" do
	 			admin.email = ""
	 			is_expected.to be false
	 		end
	 		it "同じメールアドレスで登録できないこと" do
	 			@admin.save
	 			another_admin = FactoryBot.build(:admin)
	 			another_admin.email = @admin.email
	 			another_admin.valid?
	 			expect(another_admin.errors.full_messages).to include("Emailは既に使用されています。")
	 		end
	 	end
 	end
end