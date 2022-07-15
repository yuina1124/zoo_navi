Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "animals#index"
  resources :users, only: [:show, :edit, :update]
  resources :zoos, only: [:create, :new, :index, :show, :edit, :update]
  resources :animals, only: [:create, :new, :show, :edit, :update]
end
