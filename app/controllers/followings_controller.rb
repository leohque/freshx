class FollowingsController < ApplicationController

  def create
    @following = Following.new
    @following.follower = current_user
    @following.user_id = params[:user_id]
    @following.save
  end

  def destroy
    @following = Following.find(params[:id])
    @user = @following.user
    @following.destroy
  end

end
