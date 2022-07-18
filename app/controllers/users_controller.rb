class UsersController < ApplicationController
  
  def show
    @user = current_user
    @zoos = @user.zoos
    @animals = @user.animals
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end

end
