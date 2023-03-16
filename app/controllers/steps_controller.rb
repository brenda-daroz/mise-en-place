class StepsController < ApplicationController
  before_action :set_recipe, only: %i[new create]

  def new
    @step = Step.new
  end

  def create
    @step = Step.new(step_params)
    @step.recipe = @recipe
    if @step.save
      redirect_to new_recipe_step_path(@recipe)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @step = Step.find(params[:id])
    @step.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to new_recipe_step_path(@step.recipe), status: :see_other
  end

  private

  def step_params
    params.require(:step).permit(:number, :step, :recipe_id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
