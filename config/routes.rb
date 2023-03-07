Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "pages#home"

  # resources :recipes, only: [:new, :create, :index, :show] do
  #   resources :favourites, only: [:new, :create]


  # end
  #   resources :favourites, only: :destroy

  # end



end
