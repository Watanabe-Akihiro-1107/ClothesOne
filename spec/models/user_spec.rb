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

  describe "バリデーションのテスト" do
  	let(:user) {build(:user)}
  	subject{ test_user.valid? }

  	context "nicknameカラムのバリデーションのテスト" do
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

  	context "passwordカラムのバリデーションのテスト" do
  	let(:test_user) { user }
  		it "空欄でないこと" do
  			test_user.password = ""
  			is_expected.to eq false
  		end
  		it "6文字以上であること" do
  			test_user.password =Faker::Lorem.characters(number:5)
  			is_expected.to eq false
  		end
  	end

  	context "emailカラムのテスト" do
  		before do
  		  @user = FactoryBot.build(:user)
  		end
  		it '重複したemailが存在する場合は登録できないこと' do
	  		@user.save
	  		another_user = FactoryBot.build(:user)
	  		another_user.email = @user.email
	  		another_user.valid?
	  		expect(another_user.errors.full_messages).to include('メールアドレスは既に使用されています。')
  		end
  	end
  end
end