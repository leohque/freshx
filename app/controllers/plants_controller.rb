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
      redirect_to grow_path(@grow) # here we have grow's id on line 13
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
    redirect_to grow_path(@plant.grow)
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    redirect_to grow_path(@plant.grow) # plant is grow's children (belongs_to)
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :family, :genre, :species, :birthday, :harvestday)
  end

end
