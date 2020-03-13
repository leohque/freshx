class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    @following = current_user.following_record(@user)
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_profile_path(@user)
    else
      render :new
    end
  end

  def edit_profile
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:bio, :location, :username, :photo, :banner)
  end
end
