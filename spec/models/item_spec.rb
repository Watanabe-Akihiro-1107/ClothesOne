require 'rails_helper'

RSpec.describe User, type: :model do
  # describe：Userモデルをテスト対象にすることを示している。
  context "データが正しく保存される" do
  # データが正しく保存できることに関するテストであることを示している。
    before do
    # "before"はテスト前のデータを生成している
      @user =User.new
      @user.nickname = "アキヒロ"
      @user.email ="test@test"
      @user.password = "test1234"
      @user.save
    end
    it "全て入力してあるので保存される" do
      expect(@user).to be_valid
      # expect(@user).to：saveされているデータが入っている変数を示している。
      # be_valid：@userに正しくデータが保存されているかを確認する。
    end
  end
  context "データが正しく保存されない" do
    before do
      @user = User.new
      @user.nickname = ""
      @user.email = "test@test"
      @user.password ="test1234"
      @user.save
    end
    it "nicknameが入力されていないので保存されない" do
      expect(@user).to be_invalid
      expect(@user.errors[:nickname]).to include("は1文字以上に設定して下さい。")
    end
  end
end