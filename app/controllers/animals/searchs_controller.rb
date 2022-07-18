class Animals::SearchsController < ApplicationController

  def index
    @animals = Animal.search(params[:name])
    @search_word = params[:name]
  end

 
end
