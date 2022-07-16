class AnimalsController < ApplicationController

  def new
    @animal = Animal.new
    @animal.zoo_animals.build
  end

  def create
    @animal =Animal.new
    @animal.save
    redirect_to user_path(current_user)
  end

  def index
  end

  def show
    @animal = Animal.find(params[:id])
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :image, :animal, {:zoo_ids => []})
  end
end
