class Item < ApplicationRecord
	belongs_to :user
	belongs_to :category
	belongs_to :brand, optional: true

	validates :introduction, {length: {maximum: 200}}#紹介文のカラムに200文字以内の文字制限を設けています。
  validates :brand_name, presence: true
	attachment :image
	has_many :item_comments,dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :notifications, dependent: :destroy

	def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  	end


def create_notification_like!(current_user)
  notification = current_user.active_notifications.new(
  item_id: id,
  visited_id: user_id,
  action: "like"
)
if notification.visitor_id == notification.visited_id
  notification.checked = true
end
notification.save if notification.valid?
end



def create_notification_comment!(current_user, item_comment_id)
  # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
  temp_ids = ItemComment.select(:user_id).where(item_id: id).where.not(user_id: current_user.id).distinct
  temp_ids.each do |temp_id|
  save_notification_comment!(current_user, item_comment_id, temp_id['user_id'])
end
# まだ誰もコメントしていない場合は、投稿者に通知を送る
save_notification_comment!(current_user, item_comment_id, user_id) if temp_ids.blank?
end



def save_notification_comment!(current_user, item_comment_id, visited_id)
  # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
  notification = current_user.active_notifications.new(
  item_id: id,
  item_comment_id: item_comment_id,
  visited_id: visited_id,
  action: 'comment'
)
# 自分の投稿に対するコメントの場合は、通知済みとする
if notification.visitor_id == notification.visited_id
  notification.checked = true
end
notification.save if notification.valid?
end



def self.search(search)
  if search
    Item.where(['item_name LIKE ?', "%#{search}%"])
  else
    Item.all
  end
end

end

