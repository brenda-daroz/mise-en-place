class Recipe < ApplicationRecord

  include PgSearch::Model
  has_many :steps, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  has_many :favourites, dependent: :destroy
  scope :vegetarian, -> { where(vegetarian: true) }
  scope :vegan, -> { where(vegan: true) }
  scope :meat, -> { where(vegan: false, vegetarian: false) }

  # This instead of being 2 separete colums in the Recipes table
  # remove the vegetarian and vegan columns
  # Add the category column set to integer
  # enum category {vegetarian: 0, vegetarian_and_vegan: 1, vegan: 2, meat: 3}

  pg_search_scope :global_search,
  against: [ :title, :summary],
  associated_against: {
    ingredients: :name
  },
  using: {
    tsearch: { prefix: true }
  }
end
