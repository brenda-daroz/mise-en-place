class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.save!
    redirect_to new_ingredient_path
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
