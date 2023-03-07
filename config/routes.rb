Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "pages#home"

  resources :recipes, only: [:index, :show]
  # resources :recipes, only: [:new, :create, :index, :show] do
  #   resources :favourites, only: [:new, :create]
  # end
end
