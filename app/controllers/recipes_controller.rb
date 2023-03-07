class RecipesController < ApplicationController

  def index
    if params[:vegan].present?
      if params[:query].present?
        @recipes = Recipe.where(vegan: true).global_search(params[:query])
      else
        @recipes = Recipe.where(vegan: true)
      end
    else
      if params[:query].present?
        @recipes = Recipe.global_search(params[:query])
      else
        @recipes = Recipe.all
      end
    end
  end

  def show
  end
end
