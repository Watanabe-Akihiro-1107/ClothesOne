require 'rails_helper'

RSpec.describe Category, type: :model do
	context "データが正しく保存される" do
		before do
		@category = FactoryBot.create(:category)
		end
		it "全て入力されているので保存される" do
		expect(@category).to be_valid
		end
	end

end