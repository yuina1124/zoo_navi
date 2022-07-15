class AnimalsController < ApplicationController

  def new
    @animal = Animal.all
  end

  def create
    @animal =Animal.all
    @animal.save
    redirect_to user_path(current_user)
  end

  def index
  end

  def show
    @animal = Animal.find(params[:id])
  end

end
