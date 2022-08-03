class PostsController < ApplicationController
 skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @comment = Comment.new

    if params[:hashtag]
      # @posts = Post.joins(:hashtags).where(hashtags: {name: params[:hashtag]})
      @posts = Hashtag.find_by(name: params[:hashtag]).try(:posts) || []
    elsif params[:followed]
      @posts = Post.where(user_id: current_user.followed_users.ids)
    elsif params[:query].present?
      @posts = Post.where("content ILIKE ?", "%#{params[:query]}%").order(created_at: :desc)
    else
      @posts = Post.all.order(created_at: :desc)
    end
  end

  def following
    @comment = Comment.new
    @posts = Post.where(user: current_user.followed_users)
  end

  def nearby
    @comment = Comment.new
    @localusers = User.all.near("#{current_user.latitude}, #{current_user.longitude}")
    @localposts = Post.where(user: @localusers)
  end

  def show
    @comment = Comment.new

    @post = Post.find(params[:id])
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

    if @post.update(post_params)
      redirect_to posts_path
    else
      render :new
    end
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
