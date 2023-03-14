Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "recipes#index"
  resources :pages, only: [:home]

  resources :recipes, only: %i[index show edit update] do
    get 'ingredients/:measurement/:factor', to: 'recipes#ingredients', as: :ingredients
    get 'cook', to: 'recipes#cook', as: :cook
    resources :favourites, only: %i[new create]
    get 'fav', to: 'favourites#fav', as: :fav
    resources :reviews, only: %i[create]
  end
  resources :favourites, only: %i[destroy index fav]
  resources :reviews, only: %i[destroy]
end
