class PostsController < ApplicationController

  def index
    if params[:hashtag].present?
      @posts = Hashtag.find_by(name: params[:hashtag]).posts.order(created_at: :desc)
    elsif params[:query].present?
      @posts = Post.where("content ILIKE ?", "%#{params[:query]}%").order(created_at: :desc)
    else
      @posts = Post.all.order(created_at: :desc)
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
    @grows = current_user.grows
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
    params.require(:post).permit(:content, :photo_index, :grow_id, :plant_id, photos: [])
  end
end
