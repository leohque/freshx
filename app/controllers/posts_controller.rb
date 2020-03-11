class PostsController < ApplicationController

  def index
    if params[:hashtag]
      # @posts = Post.joins(:hashtags).where(hashtags: {name: params[:hashtag]})
      @posts = Hashtag.find_by(name: params[:hashtag]).posts
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end

  def delete_photo
    photo_index = params[:photo_index]
    @post = Post.find(params[:post_id])
    @post.photos[photo_index.to_i].purge
    redirect_to edit_post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:content, :photo_index, photos: [])
  end
end
