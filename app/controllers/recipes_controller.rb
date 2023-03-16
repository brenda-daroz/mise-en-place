class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show ingredients cook]

  def index
    @categories = params.dig(:search, :category)&.drop(1)
    @recipes = Recipe.includes(:user, :ingredients).joins(:user).where(users: { username: "admin" })                               # TODO : needs to be all recipes where assoctiated user is the admin
    @recipes = @recipes.where(category: @categories) if @categories.present?
    filter_by_global
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def filter_by_global
    return unless params.dig(:search, :query).present?

    recipe_ids = @recipes.map(&:id)
    @recipes = Recipe.where(id: recipe_ids)
    @recipes = @recipes.global_search(params[:search][:query])
  end

  def cook
    @recipe = Recipe.find(params[:recipe_id])

    render "cook", locals: {
      ingredients: handleUnit(param_measurement, param_factor),
      measurement: param_measurement,
      factor: param_factor
    }
  end

  def show
    @recipe = Recipe.find(params[:id])

    @favourite = @recipe.favourites.find_by(user: current_user)
    @favourite ||= Favourite.new
    @review = Review.new

    factor = param_factor
    measurement = param_measurement

    @average_rating = @recipe.reviews.map { |review| review.rating }.sum / @recipe.reviews.count if @recipe.reviews.any?

    render locals: { measurement:, ingredients: handleUnit(measurement, factor), factor: }
  end

  def ingredients
    @recipe = Recipe.find(params[:recipe_id])

    factor = param_factor
    measurement = param_measurement

    render partial: "ingredients", locals: {
      measurement:,
      factor:,
      ingredients: handleUnit(measurement, factor)
    }
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to dashboard_path, status: :see_other
  end

  private

  def param_factor
    (params[:factor] || 1).to_f
  end

  def param_measurement
    params[:measurement] || "eu"
  end

  def recipe_params
    params.require(:recipe).permit(:title, :servings, :image, :readyInMinutes, :category, :user_id, :photo)
  end

  def handleUnit(measurement, factor)
    @recipe.recipe_ingredients.map do |ingredient|
      case measurement
      when "us"
        {
          amount: ingredient.measurement_us_amount.round(1) * factor,
          unit: ingredient.measurement_us_unit,
          name: ingredient.ingredient.name
        }
      when "eu"
        {
          amount: ingredient.measurement_eu_amount.round(1) * factor,
          unit: ingredient.measurement_eu_unit,
          name: ingredient.ingredient.name
        }
      else
        raise "measurement not found"
      end
    end
  end
end
