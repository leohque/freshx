class GrowsController < ApplicationController

  def index
    @grows = Grow.all
  end

  def show
    @grow = Grow.find(params[:id])
  end

  def new
    @grow = Grow.new
  end

  def create
    @grow = Grow.new(grow_params)
    @grow.user = current_user # link the new grow to the current_user

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

  # def delete_photo
  #   photo_index = params[:photo_index]
  #   @grow = Grow.find(params[:grow_id])

  #   @grow.photos[photo_index.to_i].purge
  #   redirect_to edit_grow_path(@grow)
  # end

  def destroy
    @grow = Grow.find(params[:id])
    @grow.destroy
    redirect_to grows_path
  end

  private

  def grow_params
    params.require(:grow).permit(:name, :description, :location, :indoors, photos: [])
  end

end
