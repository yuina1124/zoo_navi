class ZoosController < ApplicationController

  def new
    @zoo = Zoo.new
    @zoo.zoo_animals.build
  end

  def create
    @zoo = Zoo.new(zoo_params)
    @zoo.user_id = current_user.id
    animal_list = params[:zoo][:animals].split(',')
    if @zoo.save
      @zoo.save_animal(animal_list)
      redirect_to user_path(current_user.id)
    else
      render new
    end
  end

  def show
    @zoo = Zoo.find(params[:id])
    @zoo_animal = ZooAnimal.new
    @zoo_animals = @zoo.animals
  end

  def edit
    @zoo = Zoo.find(params[:id])
    @animal_list = @zoo.animals.pluck(:name).join(',')
  end

  def update
    @zoo = Zoo.find(params[:id])
    animal_list = params[:zoo][:name].split(',')
    if @zoo.update
      @old_relations = ZooAnimal.where(zoo_id: @zoo.id)
      @old_relations.each do |relation|
        relation.delete
      end
      @zoo.save_animal(animal_list)
      redirect_to user_path(current_user)
    else
      render:edit
    end
  end

  def index
    @zoos = Zoo.all
    @animal_list = Animal.all
  end

  private

  def zoo_params
    params.require(:zoo).permit(:name, :favorite, :zoo_type, :assessment, :address, :image, { :animal_ids => []})
  end

end
