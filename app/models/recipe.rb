class Recipe < ApplicationRecord

  include PgSearch::Model

  has_many :steps, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  has_many :favourites, dependent: :destroy
  belongs_to :user
  has_one_attached :photo

  # This instead of being 2 separete colums in the Recipes table
  # remove the vegetarian and vegan columns
  # Add the category column set to integer
  # enum category {vegetarian: 0, vegetarian_and_vegan: 1, vegan: 2, meat: 3}
  enum :category, { vegan: 0, vegetarian: 1, meat: 2 }


  pg_search_scope :global_search,
  against: [ :title, :summary],
  associated_against: {
    ingredients: :name
  },
  using: {
    tsearch: { prefix: true }
  }
end
