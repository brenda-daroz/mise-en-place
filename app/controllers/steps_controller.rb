class StepsController < ApplicationController

  def new
    @step = Step.new
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    @step = Step.new(step_params)
    @step.recipe = @recipe
    raise
    @step.save!
  end

  private

  def step_params
    params.require(:step).permit(:number, :step, :recipe_id)
  end

  def method_name
    
  end
end
