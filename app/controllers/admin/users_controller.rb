class Admin::UsersController < ApplicationController
   before_action :authenticate_admin!


  def top

  end
  def index
  	@users=User.all
  end

  def edit
  	@user=User.find(params[:id])
  end

  def update
  	@user=User.find(params[:id])
  	@user.update(user_status: true)
  	redirect_to admin_users_path
  end
end
