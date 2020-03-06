class LikesController < ApplicationController
  def create
    @like = Like.new
    @like.user = current_user
    @like.post = Post.find(params[:post_id])
    @like.save

    # respond_to do |format|
    #     format.html { redirect_to post_path }
    #     format.js  # <-- will render `app/views/likes/create.js.erb`
    # end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
  end
end
