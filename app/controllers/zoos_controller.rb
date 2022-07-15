class ZoosController < ApplicationController

  def new
    @zoo = Zoo.new
  end

  def create
    @zoo = Zoo.new
    @zoo.save
    redirect_to user_path(current_user)
  end

  def show
    @zoo = Zoo.find(params[:id])
  end

end
