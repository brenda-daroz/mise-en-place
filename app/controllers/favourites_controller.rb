class FavouritesController < ApplicationController

  def index
    @favourites = Favourite.where(user: current_user)
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @favourite = Favourite.new
  end

  def create
    @favourite = Favourite.new(favourite_params)
    @favourite.user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    @favourite.recipe = @recipe
    @favourite.save
  end

  def destroy
    @favourite = Review.find(params[:id])
    @favourite.destroy
  end

end
