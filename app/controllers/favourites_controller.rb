class FavouritesController < ApplicationController
  before_action :authenticate_user!

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
    if @favourite.save
      redirect_to recipe_path(@recipe), status: :see_other
    else
      render 'recipe/show', status: :unprocessable_entity
    end
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @recipe = @favourite.recipe
    @favourite.destroy
    redirect_to recipe_path(@recipe)
  end

end
