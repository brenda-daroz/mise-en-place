class ReviewsController < ApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.new(review_params)
    @review.recipe = @recipe
    @review.user = current_user

    respond_to do |format|
      if @review.save
        format.html { redirect_to recipe_path(@recipe) }
        format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.html { render "recipes/show", status: :unprocessable_entity }
        format.json # Follow the classic Rails flow and look for a create.json view
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
