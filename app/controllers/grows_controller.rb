class GrowsController < ApplicationController

  def index
    @user = current_user
  end

  def show
    @comment = Comment.new
    @grow = Grow.find(params[:id])
    @participating = GrowUser.where(grow: @grow)
  end

  def new
    @grow = Grow.new
  end

  def create
    @grow = Grow.new(grow_params)
    @grow.user = current_user

    # to check if valid instead of saving, would be:
    # if @grow.valid?
    if @grow.save
      redirect_to grow_path(@grow)
    else
      render :new
    end
  end

  def edit
    @grow = Grow.find(params[:id])
  end

  def update
    @grow = Grow.find(params[:id])
    @grow.update(grow_params)
    redirect_to grow_path(@grow)
  end

  def destroy
    @grow = Grow.find(params[:id])
    @grow.destroy
    redirect_to grows_path
  end

  private

  def grow_params
    params.require(:grow).permit(:name, :description, :location, :indoors, :photo)
  end

end
