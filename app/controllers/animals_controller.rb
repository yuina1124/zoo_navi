class AnimalsController < ApplicationController

  def new
    @animal = Animal.new
    @animal.zoo_animals.build
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user_id = current_user.id
    @animal.save
    redirect_to user_path(current_user)
  end

  def index
  end

  def show
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :image, :animal, :introduction, {:zoo_ids => []})
  end
end
