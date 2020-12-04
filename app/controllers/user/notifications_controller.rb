class User::NotificationsController < ApplicationController

	def index
        @user= current_user
    	#current_userの投稿に紐づいた通知一覧
    	@notifications = current_user.passive_notifications.page(params[:page]).per(6)
    	#@notificationの中でまだ確認していない(indexに一度も遷移していない)通知のみ
    	if @notifications.where(checked: false).each do |notification|
    	   notification.update_attributes(checked: true)
    	end
    	end
	end

    def destroy_all
    	@notifications = current_user.passive_notifications.destroy_all
    	redirect_to notifications_path
    end
end

