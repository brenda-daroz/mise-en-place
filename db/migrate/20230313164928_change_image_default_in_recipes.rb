class ChangeImageDefaultInRecipes < ActiveRecord::Migration[7.0]
  def change
    change_column_default :recipes, :image, "no-image.jpeg"
  end
end
