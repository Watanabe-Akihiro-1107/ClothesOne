class User::FavoritesController < ApplicationController
  	def index
  		@user = User.find(params[:id])
  		@items = @user.favorite_items.order(created_at: :desc)
  	end


  	def create
  		@item = Item.find(params[:item_id])
    	favorite = current_user.favorites.new(item_id: @item.id)
    	favorite.save
      @item.create_notification_like!(current_user)
    	
  	end

  	def destroy
      @item = Item.find(params[:item_id])
      favorite = current_user.favorites.find_by(item_id: @item.id)
      favorite.destroy
      
 	end


end
