class PlantsController < ApplicationController
    
     # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  #GET /plants/:id
  def show 
    plant = Plant.find_by(id: params[:id])
    if plant 
        render json: plant
    else
        render json: { error: "Plant not found" }, status: :not_found
    end
  end

#   def create
#     # byebug
#     plant = Plant.create(name: params[:name], image: params[:image], price: params[:price])
#     render json: plant, status: :created
#   end
 # POST /plants using strong params
 def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end
  private
  # all methods below here are private

  def plant_params
    params.permit(:name, :image, :price)
  end
end
