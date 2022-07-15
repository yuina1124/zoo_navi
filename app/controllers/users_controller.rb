class UsersController < ApplicationController
  def show
    @user = current_user
    @zoo = Zoo.find(params[:id])
  end

  def edit
  end
end
