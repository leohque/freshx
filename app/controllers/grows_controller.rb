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
    @grow.save
  end

  def edit
    @grow = Grow.find(params[:id])
  end

  def update
    @grow = Grow.find(params[:id])
    @grow.update
  end

  def destroy
    @grow = Grow.find(params[:id])
    @grow.destroy
  end

  private

  def grow_params
    params.require(:grow).permit(:name, :description, :location, :indoors)
  end

end
