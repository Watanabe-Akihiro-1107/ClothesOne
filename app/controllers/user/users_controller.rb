class User::UsersController < ApplicationController



  def show
  	@user=User.find(params[:id])
    @items = Item.where(user_id: @user.id)
  end
  def delete_page
  end

  def withdraw
  end

  	private
	def user_params
		params.require(:user).permit(:nickname,:user_status,:email)
	end
end
