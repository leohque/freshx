class UsersController < ApplicationController
    skip_before_action :authenticate_user!

  def show
    @user = User.find(params[:user_id])
  end

  def update_profile
    @user = current_user
    @user.update(user_params)
    redirect_to user_profile_path(current_user)
  end

  def edit_profile
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:bio, :location, :username)
  end
end
