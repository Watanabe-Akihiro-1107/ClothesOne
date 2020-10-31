class Item < ApplicationRecord
	belongs_to :user
	belongs_to :category
	belongs_to :brand, optional: true

	validates :introduction, {length: {maximum: 200}}#紹介文のカラムに200文字以内の文字制限を設けています。
	attachment :image
	has_many :item_comments,dependent: :destroy
end
