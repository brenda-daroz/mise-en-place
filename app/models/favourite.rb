class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :user, uniqueness: { scope: :recipe, message: "Can't Favourite same recipe" }
end
