class RecipeIngredientsController < ApplicationController

  def new
    # @ingredient = Ingredient.new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_ingredients = RecipeIngredient.where(recipe_id: @recipe.id)
    @recipe_ingredient = RecipeIngredient.new
    @recipe_ingredient.build_ingredient
  end

  def create
    # @ingredient = Ingredient.find(params[:ingredient_id])
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)
    @recipe_ingredient.recipe = @recipe
    # @recipe_ingredient.ingredient = @ingredient
    if @recipe_ingredient.save
      redirect_to new_recipe_recipe_ingredient_path(@recipe.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:measurement_eu_amount, :measurement_eu_unit, ingredient_attributes: [:name])
  end
end
