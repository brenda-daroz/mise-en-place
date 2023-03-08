class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:vegan].present?
      if params[:query].present?
        @recipes = Recipe.where(vegan: true).global_search(params[:query])
      else
        @recipes = Recipe.where(vegan: true)
      end
    elsif params[:query].present?
      @recipes = Recipe.global_search(params[:query])
    else
      @recipes = Recipe.all
    end
  end

  def show
    @recipe = Recipe.find(params[:id])

    render locals: { measurement: "eu", ingredients: x("eu") }
  end

  def ingredients
    @recipe = Recipe.find(params[:recipe_id])

    render partial: "ingredients", locals: { measurement: params[:measurement], ingredients: x(params[:measurement]) }
  end

  private

  def x(measurement)
    @recipe.recipe_ingredients.map do |ingredient|
      if measurement == "us"
        {
          amount: ingredient.measurement_us_amount,
          unit: ingredient.measurement_us_unit,
          name: ingredient.ingredient.name
        }
      elsif measurement == "eu"
        {
          amount: ingredient.measurement_eu_amount.round(0),
          unit: ingredient.measurement_eu_unit,
          name: ingredient.ingredient.name
        }
      else
        raise "measurement not found"
      end
    end
  end
end
