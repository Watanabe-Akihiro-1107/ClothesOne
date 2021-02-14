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
end