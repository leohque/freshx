class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home

    if current_user.present?
      redirect_to posts_path
    end
  end

  def map
    @users = User.geocoded #returns users with coordinates

    @markers = @users.map do |user|
      if user.photo.attached?
        user_avatar = Cloudinary::Utils.cloudinary_url(user.photo.key, {})
      else
        user_avatar = 'anon.jpg'
      end
       {
        lat: user.latitude + rand(-0.02..0.02),
        lng: user.longitude + rand(-0.02..0.02),
        infoWindow: render_to_string(partial: "users/info_window", locals: { user: user }),
        image_url: helpers.asset_url(user_avatar)
      }
    end
  end
end
