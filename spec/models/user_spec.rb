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

  context "データが正しく保存されない" do
  	before do
  		@user =User.new
  		@user.nickname =""
  		@user.email = ""
  		@user.password = " "
  	end
  	it "passwordが入力されていないので保存されない" do
  	  expect(@user).to be_invalid
  	  expect(@user.errors[:password]).to include("が入力されていません。")
  	end
  	it "emailが入力されていないので保存されない" do
  	  expect(@user).to be_invalid
  	  expect(@user.errors[:email]).to include("が入力されていません。")
  	end
  	it "nicknameが入力されていないので保存されない" do
  	  expect(@user).to be_invalid
  	  expect(@user.errors[:nickname]).to include("が入力されていません。")
  	end
  end
end