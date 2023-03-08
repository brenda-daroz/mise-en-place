Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "pages#home"

  resources :recipes, only: %i[index show] do
    get 'ingredients/:measurement', to: 'recipes#ingredients', as: :ingredients
    get 'cook', to: 'recipes#cook', as: :cook
    resources :favourites, only: [:create]
  end

  resources :favourites, only: %i[delete show]
end 
