class User::UsersController < ApplicationController

  def edit
    @user=User.find(params[:id])
    if current_user.id != @user.id
      redirect_to root_path
    end
  end

  def update
    @user=User.find(params[:id])
    @user.update(user_params)
    if admin_signed_in?
      redirect_to root_path
    elsif user_signed_in?
    redirect_to user_path(@user.id)
  end
  end

  def show
  	@user=User.find(params[:id])
    @items = Item.where(user_id: @user.id)
  end
  def delete_page
    @user = User.find(current_user.id)
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(user_status: false)
    #user_statusカラムにフラグを立てる　default:true（有効会員)からflase（退会済）へ
    reset_session
    #ログアウトさせる
    redirect_to root_path
  end

  	private
	def user_params
		params.require(:user).permit(:nickname,:user_status,:email,:profile_image)
	end
end
