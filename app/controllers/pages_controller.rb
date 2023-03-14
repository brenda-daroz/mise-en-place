class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @recipes = Recipe.where(user_id: current_user)
  end
end
