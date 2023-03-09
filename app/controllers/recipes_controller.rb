class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    # @recipes = Recipe.all



    if params[:query].present?
      @recipes = Recipe.global_search(params[:query])
    elsif params.keys.length == 4
      if params[:vegan] == "true"
        @recipes = Recipe.where(vegan: true).global_search(params[:query])
      elsif params[:veggie] == "true"
        @recipes = Recipe.where(vegetarian: true).global_search(params[:query])
      elsif params[:meat] == "true"
        @recipes = Recipe.where.not(vegan: true).where.not(vegetarian: true).global_search(params[:query])
      elsif params.keys.length == 3
        if params[:vegan] == "true"
          @recipes = Recipe.where(vegan: true)
        elsif params[:veggie] == "true"
          @recipes = Recipe.where(vegetarian: true)
        elsif params[:meat] == "true"
          @recipes = Recipe.where.not(vegan: true).where.not(vegetarian: true)
        end
      end 
    else
    @recipes = Recipe.all
    end

    # @recipes = Recipe.where(vegan: true) if params[:vegan] == "true"
    # @recipes = Recipe.where(vegan: true).global_search(params[:query]) if params[:vegan] == "true" && params[:query].present?
    # @recipes = Recipe.where(vegetarian: true) if params[:veggie] == "true"
    # @recipes = Recipe.where(vegetarian: true).global_search(params[:query]) if params[:veggie] == "true" && params[:query].present?
    # @recipes = Recipe.where.not(vegan: true).where.not(vegetarian: true) if params[:meat] == "true"
    # @recipes = Recipe.where.not(vegan: true).where.not(vegetarian: true).global_search(params[:query]) if params[:meat] == "true" && params[:query].present?
    # @recipes = Recipe.global_search(params[:query]) if params[:query].present?

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
