class PlantsController < ApplicationController

  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = Plant.find_by(id: params[:id])
    render json: plant
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  #PATCH /plants/:id
  def update
    plants = Plant.find_by(id: params[:id])
    if plants 
      plants.update(plant_params)
      render json: plants, status: :accepted
    else 
      render json: { error: "plants not found" }, status: :not_found
    end
  end 

  #DELETE /plants/:id
  def destroy
    plants = Plant.find_by(id: params[:id])
    if plants
      plants.destroy
      head :no_content
    else 
      render json: { error: "plants not found" }, status: :not_found
    end
  end

  private

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end
end
