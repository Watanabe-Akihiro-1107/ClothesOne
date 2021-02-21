require "rails_helper"
RSpec.describe Admin ,type: :model do
	describe "正しく保存される" do
		before do
			@admin = FactoryBot.create(:admin)
		end
		it "全て入力されているので正しく保存される" do
		expect(@admin).to be_valid
		end
 	end
end