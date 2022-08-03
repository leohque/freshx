class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # if current_user.present?
    redirect_to posts_path
    # else
    #  redirect_to new_user_session_path
   # end
  end

  def map
    @users = User.geocoded #returns users with coordinates
    @localusers = User.geocoded.near("#{current_user.latitude}, #{current_user.longitude}")

    @growers = @users.select do |user|
      user.posts.present?
    end

    @localgrowers = @localusers.select do |user|
      user.posts.present?
    end


    @localmarkers = @localgrowers.map do |grower|
      {
        lat: grower.latitude,
        lng: grower.longitude
      }
    end

    @markers = @growers.map do |user|
      if user.photo.attached?
        user_avatar = Cloudinary::Utils.cloudinary_url(user.photo.key, {})
      else
        user_avatar = 'anon.jpg'
      end
       {
        lat: user.latitude + rand(-0.01..0.01),
        lng: user.longitude + rand(-0.01..0.01),
        infoWindow: render_to_string(partial: "users/info_window", locals: { user: user }),
        image_url: helpers.asset_url(user_avatar)
      }
    end
  end
end
