class PlantsController < ApplicationController

  def show
    @plant = Plant.find(params[:id])
  end

  def new
    @grow = Grow.find(params[:grow_id])
    @plant = Plant.new
  end

  def create
    @grow = Grow.find(params[:grow_id])
    @plant = Plant.new(plant_params)
    @plant.grow = @grow # belongs_to
    @plant.user = current_user # belongs_to


    if @plant.save
      redirect_to grow_path(@grow)
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
    @grow = Grow.find(params[:grow_id])
    @plant = Plant.find(params[:id])
    @plant.destroy
    redirect_to grow_plants_path
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :family, :genre, :species, :birthday, :harvestday)
  end

end
