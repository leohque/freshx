class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @posts = Post.all
  end

  def map
    @users = User.geocoded #returns users with coordinates

    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end
end
