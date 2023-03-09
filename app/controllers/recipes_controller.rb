class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show ingredients]

  def index
    categories = params.dig(:search, :category)&.drop(1) || []
    @recipes = []
    categories.each { |category| @recipes += Recipe.public_send(category) }
    @recipes = Recipe.all if categories.empty?
    filter_by_global
  end

  def filter_by_global
    return unless params.dig(:search, :query).present?
    recipe_ids = @recipes.map(&:id)
    @recipes = Recipe.where(id: recipe_ids)
    @recipes = @recipes.global_search(params[:search][:query])
  end

  def cook
  end

  def show
    @recipe = Recipe.find(params[:id])
    @favourite = Favourite.new

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
