class FavouritesController < ApplicationController

  def index
    @favourites = Favourite.where(user: current_user)
  end

  def create
    @favo = Favourite.new
    @favo.user = current_user
    @favo.recipe = Recipe.find(params[:recipe_id])
    @favo.save
  end

  def destroy
    @favo = Review.find(params[:id])
    @favo.destroy
  end

end
