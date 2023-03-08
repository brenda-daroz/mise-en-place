class FavouritesController < ApplicationController



  def show

      @favorites  = Favorite.where(user_id: current_user.id)

  end


  end

  Recipe.all.each do | recipe |
    favo = Favorite.new(user_id: user.id, recipe_id: recipe.id )
    favo.save!
  end


  def create
    favo = Favorite.new
    favo.user = current_user
    favo.recipe = Recipe.find(params[:recipe_id])
    favo.save
  end

end
