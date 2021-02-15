class ItemComment < ApplicationRecord
	belongs_to :user
	belongs_to :item
	has_many :notifications, dependent: :destroy

	validates :comment, presence: true, length: {maximum: 150}
end
