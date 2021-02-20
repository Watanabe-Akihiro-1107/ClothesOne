require 'rails_helper'

RSpec.describe User, type: :model do
  context "データが正しく保存される" do
    before do
      @user = FactoryBot.create(:user)
    end
    it "全て入力してあるので保存される" do
      expect(@user).to be_valid
      # be_valid：@userに正しくデータが保存されているかを確認する。
    end
  end

  describe "バリデーションのチェック" do
  	let(:user) {create(:user)}
  	subject{ test_user.valid? }

  	context "nicknameカラムのチェック" do
  	let(:test_user) { user }
  	 it "空欄でないこと" do
  	 	test_user.nickname = ""
  	 	is_expected.to eq false
  	 end

  	 it "3文字以上であること" do
  	 	test_user.nickname = Faker::Lorem.characters(number:2)
  	 	is_expected.to eq false
  	 end

  	 it "20文字以内であること" do
  	 	test_user.nickname = Faker::Lorem.characters(number:21)
  	 	is_expected.to eq false
  	 end
  	end
  end
end