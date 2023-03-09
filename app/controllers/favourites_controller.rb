class FavouritesController < ApplicationController

  def index
    @favourites = Favourite.where(user: current_user)
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @favourite = Favourite.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @favourite = Favourite.new
    @favourite.user = current_user
    @favourite.recipe = @recipe
    @favourite.save
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
  end

end
