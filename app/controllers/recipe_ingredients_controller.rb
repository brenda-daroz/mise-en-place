class RecipeIngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_ingredient = RecipeIngredient.new
  end

  def create
  @ingredient = Ingredient.where(name: params[:name])
  raise
  @recipe = Recipe.find(params[:recipe_id])
  @recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)
  @recipe_ingredient.recipe = @recipe
  @recipe_ingredient.ingredient = @ingredient
  if @recipe_ingredient.save!
    redirect_to recipe_path(@recipe)
  else
    redirect_to new_recipe_recipe_ingredient_path
  end
  end

  private

  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:measurement_eu_amount, :measurement_eu_unit, :recipe_id, :ingredient_id)
  end
end
