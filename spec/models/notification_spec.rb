require "rails_helper"

RSpec.describe Notification, type: :model do
	describe "正しく保存される" do
		# let(:notification) { build(:notification) }
		# subject {notification.valid?}
		before do
			@notification = Notification.new
		end
		context "投稿にいいねがされたとき正しく保存される" do
			it "空欄でないこと" do
			expect(@notification).to be_valid
			end
		end
	end
end