class ZoosController < ApplicationController

  def new
    @zoo = Zoo.new
    @animal_list = @zoo.animals.pluck(:name).join(',')
    @zoo.zoo_animals.build
  end

  def create
    @zoo = Zoo.new(zoo_params)
    @zoo.user_id = current_user.id
    animal_list = params[:zoo][:animals].split(',')
    if @zoo.save!
      @zoo.save_animal(animal_list, params[:zoo][:animal_ids], current_user)
      # @zoo.save_animal_chackbox(params[:zoo][:animal_ids])
      redirect_to user_path(current_user.id)
    else
      render new
    end
  end

  def show
    @zoo = Zoo.find(params[:id])
  end

  def edit
    @zoo = Zoo.find(params[:id])
    @animal_list = @zoo.animals.pluck(:name).join(',')
  end

  def update
    @zoo = Zoo.find(params[:id])
    animal_list = params[:zoo][:animals].split(',')
    if @zoo.update!(zoo_params)
      # @old_relations = ZooAnimal.where(zoo_id: @zoo.id)
      # @old_relations.each do |relation|
      #   relation.delete
      # end
      @zoo.save_animal(animal_list, params[:zoo][:animal_ids], current_user)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def index
    @zoos = Zoo.all
    @animal_list = Animal.all
  end

  private

  def zoo_params
    params.require(:zoo).permit(:name, :favorite, :zoo_type, :assessment, :address, :image, :user_id, { :animal_ids => []})
  end

end
