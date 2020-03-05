class UsersController < ApplicationController
    skip_before_action :authenticate_user!

  def show
    @user = User.find(params[:user_id])

    authorize @user
  end

  def update_profile
    @user = current_user
    authorize @user
    @user.update(user_params)
    redirect_to user_profile_path(current_user)
  end

  def edit_profile
    @user = current_user
    authorize @user
  end

  private

  def user_params
    params.require(:user).permit(:bio, :address, :weblink, :photo, :username)
  end
end
