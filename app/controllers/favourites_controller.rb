class FavouritesController < ApplicationController

  def show
    @favorites = Favorite.where(user: current_user)
  end

  def create
    @favo = Favorite.new
    @favo.user = current_user
    @favo.recipe = Recipe.find(params[:recipe_id])
    @favo.save
  end

  def del

end
