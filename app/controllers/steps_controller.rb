class StepsController < ApplicationController
  before_action :set_recipe, only: %i[new create]

  def new
    @step = Step.new
  end

  def create
    @step = Step.new(step_params)
    @step.recipe = @recipe
    @step.save!
    redirect_to new_recipe_step_path(@recipe)
  end

  private

  def step_params
    params.require(:step).permit(:number, :step, :recipe_id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
