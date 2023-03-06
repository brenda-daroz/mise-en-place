class ChangeColumnImageInRecipes < ActiveRecord::Migration[7.0]
  def change
    change_column :recipes, :image, :string
  end
end
