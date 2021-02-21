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
 	end
end