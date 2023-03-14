class FavouritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favourites = Favourite.where(user: current_user)
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @favourite = Favourite.new
  end

  def fav
    @recipe = Recipe.find(params[:recipe_id])
    @fav = Favourite.where(recipe: @recipe, user: current_user)
    if @fav.any?
      @fav.first.destroy
    else
      create
    end
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @favourite = Favourite.new
    @favourite.user = current_user
    @favourite.recipe = @recipe
    @favourite.save
  end

end
