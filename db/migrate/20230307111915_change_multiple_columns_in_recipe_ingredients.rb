class ChangeMultipleColumnsInRecipeIngredients < ActiveRecord::Migration[7.0]
  def change
    change_table(:recipe_ingredients) do |t|
      t.references :ingredient, null: false, foreign_key: true
      t.remove :references
      t.remove :ingredient
    end
  end
end
