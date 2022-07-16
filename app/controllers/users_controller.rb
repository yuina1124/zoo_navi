class UsersController < ApplicationController
  def show
    @user = current_user
    @zoo = @user.zoos
  end

  def edit
  end
end
