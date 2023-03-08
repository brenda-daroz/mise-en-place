class Recipe < ApplicationRecord
  
  include PgSearch::Model
  has_many :steps, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  has_many :favourites, dependent: :destroy

  pg_search_scope :global_search,
  against: [ :title, :summary ],
  associated_against: {
    ingredients: :name
  },
  using: {
    tsearch: { prefix: true }
  }
end
