class PlantsController < ApplicationController

  def index
    @plants = Plant.all
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.grow = Grow.find(params[:id])

    if @plant.save
      redirect_to grow_plant_path(@plant)
    else
      render :new
    end

  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:id])
    @plant.update(plant_params)
    redirect_to grow_plant_path(@plant)
  end

  def delete
    @plant = Plant.find(params[:id])
    @plant.destroy
    redirect_to grow_plants_path
  end

  private

  def plant_params
    params.require(:plant).permit(:name)
  end

end
