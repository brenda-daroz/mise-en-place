Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "recipes#index"
  resources :pages, only: [:home]

  resources :recipes do
    get 'ingredients/:measurement/:factor', to: 'recipes#ingredients', as: :ingredients
    get 'cook', to: 'recipes#cook', as: :cook
    resources :favourites, only: %i[new create]
    resources :steps, only: %i[new create]
    resources :ingredients, only: %i[new create]
  end

  resources :recipe_ingredients, only: %i[new create]
  resources :favourites, only: %i[destroy index]
end
