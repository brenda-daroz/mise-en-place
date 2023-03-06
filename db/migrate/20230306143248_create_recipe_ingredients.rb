class CreateRecipeIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_ingredients do |t|
      t.references :recipe, null: false, foreign_key: true
      t.string :ingredient
      t.string :references
      t.float :measurement_us_amount
      t.float :measurement_eu_amount
      t.string :measurement_us_unit
      t.string :measurement_eu_unit

      t.timestamps
    end
  end
end
