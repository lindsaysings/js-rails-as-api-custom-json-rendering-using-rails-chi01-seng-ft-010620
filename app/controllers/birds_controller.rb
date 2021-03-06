class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: birds
    # render json: birds, only: [:id, :name, :species]
    render json: birds, except: [:created_at, :updated_at]
  end

  def show
    if
      bird = Bird.find_by(id: params[:id])
      p params
      render json: { id: bird[:id], name: bird[:name], species: bird[:species] }
      # render json: bird.slice(:id, :name, :species)
    else
      render json: { error: "Bird not found"}
    end
  end

  
end
