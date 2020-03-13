class LikesController < ApplicationController
  def index
    # @likes = Like.where(user: current_user)
    @comment = Comment.new
    @likes = current_user.likes.order(created_at: :desc)
    @posts = []
    @likes.each do |like|
      @posts << like.post
    end
    # @likes = policy_scope(Order).order(created_at: :desc) # -> this would give us the same result

  end

  def create
    @like = Like.new
    @like.user = current_user
    @like.post = Post.find(params[:post_id])
    @like.save

    respond_to do |format|
      format.html { redirect_to post_path(@like.post) }
      format.js  # <-- will render `app/views/likes/create.js.erb`
    end
  end

  def destroy
    @like = Like.find(params[:id])

    @post_id = @like.post_id

    @like.destroy

    respond_to do |format|
      format.html { redirect_to post_path(@like.post) }
      format.js  # <-- will render `app/views/likes/create.js.erb`
    end
  end
end
